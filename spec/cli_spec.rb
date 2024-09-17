require 'spec_helper'
require 'json'
require 'terminal-table'
require 'logger'
require_relative '../cli'

# Set up the logger
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

RSpec.describe 'CLI Application' do
  let(:data) do
    [
      { 'email' => 'test@example.com', 'full_name' => 'Test User' },
      { 'email' => 'duplicate@example.com', 'full_name' => 'Duplicate User' },
      { 'email' => 'duplicate@example.com', 'full_name' => 'Another Duplicate' }
    ]
  end

  before do
    allow_any_instance_of(Object).to receive(:load_data).and_return(data)
  end

  describe '#dynamic_search' do
    it 'returns matching results based on the query' do
      logger.info("Running dynamic_search test")
      results = dynamic_search(data, 'email', 'test@example.com')
      logger.debug("Results: #{results.inspect}")
      expect(results).to eq([{ 'email' => 'test@example.com', 'full_name' => 'Test User' }])
    end
  end

  describe '#find_duplicates' do
    it 'returns data with duplicate values' do
      logger.info("Running find_duplicates test")
      results = find_duplicates(data, 'email')
      logger.debug("Results: #{results.inspect}")
      expect(results).to eq([
                              { 'email' => 'duplicate@example.com', 'full_name' => 'Duplicate User' },
                              { 'email' => 'duplicate@example.com', 'full_name' => 'Another Duplicate' }
                            ])
    end
  end

  describe '#display_table' do
    it 'formats data correctly' do
      logger.info("Running display_table test")

      # Capture the output of `puts`
      output = StringIO.new
      allow($stdout).to receive(:puts) { |msg| output.puts(msg) }

      display_table(data)
      logger.debug("Captured output:\n#{output.string}")

      # Check if the output contains expected data
      expect(output.string).to include('Test User')
    end
  end
end
