class MembershipsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

    def create
        membership = Membership.create!(params_permit)
        render json: membership, status: :created
    end

    private 

    def unprocessable_entity_response(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def params_permit
        params.permit(:gym_id, :client_id, :charge)
    end

    def not_unique
        render json: { error: "Client cannot join the same gym twice."}, status: :unprocessable_entity
    end

end
