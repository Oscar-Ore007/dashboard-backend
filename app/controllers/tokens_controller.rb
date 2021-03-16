class TokensController < ApplicationController

    def create 
        user = User.find_by("lower(username) = ?", params[:username].downcase)

        if user && user.authenticate(params[:password])
            render json: auth_response_json(user)
        else 
            render json: { errors: ["Sorry!! Couldn't find that user."] }
        end 
    end 

    def persist
        if authenticated?
            render json: auth_response_json(current_logged_in_user)
        else 
            notify_unauthorized_user
        end 
    end 

end 