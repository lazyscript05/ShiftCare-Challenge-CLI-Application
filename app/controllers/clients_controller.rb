class ClientsController < ApplicationController
  include Pagy::Backend

  # List of fields allowed for searching or finding duplicates
  ALLOWED_FIELDS = Client.column_names - %w[id created_at updated_at]

  # GET /clients
  # Handles requests to the index action for listing clients. Supports searching and finding duplicates.
  def index
    queries = Client.all

    # Handle search functionality
    if params[:q].present?
      field = params[:field] || "full_name"

      # Validate the search field
      unless ALLOWED_FIELDS.include?(field)
        render json: {error: "Invalid search field: #{field}"}, status: :bad_request
        return
      end

      # Validate the search query
      if params[:q].blank?
        render json: {error: "Search query can't be blank"}, status: :bad_request
        return
      end

      # Perform the search using the ClientSearchService
      search_service = ClientSearchService.new(query: params[:q], field: field)
      queries = search_service.search

      # Handle duplicates functionality
    elsif params[:duplicates].present?
      field = params[:field]

      # Validate the field parameter
      if field.blank?
        render json: {error: "Field parameter is required"}, status: :bad_request
        return
      end

      # Validate the field
      unless ALLOWED_FIELDS.include?(field)
        render json: {error: "Invalid field: #{field}"}, status: :bad_request
        return
      end

      # Find duplicates using the ClientDuplicateService
      duplicate_service = ClientDuplicateService.new(field: field)
      queries = duplicate_service.find_duplicates
    end

    # Paginate the results
    @pagy, @clients = pagy(queries)

    respond_to do |format|
      format.html # renders index.html.erb
      format.json # renders index.json.jbuilder
    end
  end
end
