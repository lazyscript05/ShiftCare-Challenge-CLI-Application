# app/services/client_search_service.rb
class ClientSearchService
  # Initializes the service with a search query and field to search.
  #
  # @param query [String] The search query.
  # @param field [String] The field to search within.
  def initialize(query:, field:)
    @query = query
    @field = field
  end

  # Searches for clients where the specified field matches the search query.
  #
  # @return [ActiveRecord::Relation] Clients that match the search criteria.
  def search
    # Use ILIKE for case-insensitive partial match search
    Client.where("#{@field} ILIKE ?", "%#{@query}%")
  end
end
