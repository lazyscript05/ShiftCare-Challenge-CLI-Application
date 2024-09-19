# app/services/client_duplicate_service.rb
class ClientDuplicateService
  # Initializes the service with the field to check for duplicates.
  #
  # @param field [String] The field to check for duplicate values.
  def initialize(field:)
    @field = field
  end

  # Finds and returns clients with duplicate values in the specified field.
  #
  # @return [ActiveRecord::Relation] Clients with duplicate values in the specified field.
  def find_duplicates
    # Group clients by the field and select those having more than one occurrence
    duplicates = Client.group(@field).having("count(#{@field}) > 1").pluck(@field)
    # Return clients whose field values match the duplicates found
    Client.where(@field => duplicates)
  end
end
