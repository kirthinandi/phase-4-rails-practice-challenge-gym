class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def show 
        gym = find_gym
        render json: gym, status: :ok
    end

    def destroy 
        gym = find_gym
        gym.destroy
        head :not_content
    end

    private

    def not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end

    def find_gym
        Gym.find(params[:id])
    end
end
