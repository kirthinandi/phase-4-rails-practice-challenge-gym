class ClientsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def show
        client = find_client
        render json: client, status: :ok
    end

    private 

    def not_found_response
        render json: { error: "Client not found" }, status: :not_found
    end

    def find_client
        Client.find(params[:id])
    end
end
