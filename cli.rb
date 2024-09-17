# ========================
# Code Signature:
# Author: Cris Joseph Nahine
# ========================

require 'json'
require 'terminal-table'

# Loads data from a JSON file.
# @param file_path [String] The path to the JSON file containing data. Defaults to 'data.json'.
# @return [Array<Hash>] An array of data hashes.
def load_data(file_path = 'data.json')
  JSON.parse(File.read(file_path))
end

# Searches for data based on a specific field and query.
# @param data [Array<Hash>] The array of data hashes.
# @param field [String] The field to search by (e.g., 'email', 'full_name').
# @param query [String] The search query.
# @return [Array<Hash>] An array of data hashes that match the search criteria.
def dynamic_search(data, field, query)
  data.select { |data| data[field].to_s.downcase.include?(query.downcase) }
end

# Finds data with duplicate values in a specified field.
# @param data [Array<Hash>] The array of data hashes.
# @param field [String] The field to check for duplicates (e.g., 'email', 'full_name').
# @return [Array<Hash>] An array of data hashes with duplicate values in the specified field.
def find_duplicates(data, field)
  values = data.map { |data| data[field] }
  duplicates = values.select { |value| values.count(value) > 1 }.uniq
  data.select { |data| duplicates.include?(data[field]) }
end

# Formats and displays the data in a table format.
# @param data [Array<Hash>] The array of data hashes.
def display_table(data)
  return puts "No data to display." if data.empty?

  # Extract column headings from the keys of the first data
  headings = data.first.keys.map { |key| key.split('_').map(&:capitalize).join(' ') }

  table = Terminal::Table.new do |t|
    t.headings = headings
    t.rows = data.map do |data|
      headings.map { |heading| data[heading.downcase.gsub(' ', '_')] }
    end
  end
  puts table
end

# Main function to interact with the user and perform operations based on user input.
# Prompts the user to choose between searching for data, finding duplicates, or exiting.
def main
  data = load_data

  loop do
    puts "\nWelcome to the Management System!"
    puts "========================================"
    puts "Choose an option:"
    puts "1. Search data by a field"
    puts "2. Find data with duplicate values"
    puts "3. Exit"
    print "\nYour choice: "

    choice = gets.chomp.to_i

    case choice
    when 1
      # Dynamically fetch and display available fields from data
      fields = data.first.keys
      puts "\nSelect the field you want to search by:"
      fields.each_with_index do |field, index|
        puts "#{index + 1}. #{field.split('_').map(&:capitalize).join(' ')}"
      end
      print "\nYour choice (number): "
      field_choice = gets.chomp.to_i

      field = fields[field_choice - 1]
      if field
        print "\nEnter your search query: "
        query = gets.chomp
        results = dynamic_search(data, field, query)
        puts "\nSearch Results:"
        display_table(results)
      else
        puts "\nInvalid option. Please select a valid field number."
      end
    when 2
      # Dynamically fetch and display available fields from data
      fields = data.first.keys
      puts "\nSelect the field to check for duplicates:"
      fields.each_with_index do |field, index|
        puts "#{index + 1}. #{field.split('_').map(&:capitalize).join(' ')}"
      end
      print "\nYour choice (number): "
      field_choice = gets.chomp.to_i

      field = fields[field_choice - 1]
      if field
        field_name = field.split('_').map(&:capitalize).join(' ')
        duplicates = find_duplicates(data, field)
        puts "\nDuplicate #{field_name}:"
        display_table(duplicates)
      else
        puts "\nInvalid option. Please select a valid field number."
      end
    when 3
      puts "\nThank you for using the Management System. Goodbye!"
      break
    else
      puts "\nInvalid option. Please select 1, 2, or 3."
    end
  end
end

# Ensures the script runs only when executed directly, not when required by other scripts.
main if __FILE__ == $PROGRAM_NAME
