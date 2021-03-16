class ApplicationController < ActionController::API

    def authorized?(user_id)
        #Token 
        token = try_get_jwt_token

        return token.present? && token["user_id"] == user_id.to_i 

    end 


    def current_logged_in_user 

        if authenticated?
            user_id = try_get_jwt_token["user_id"]

            User.find(user_id)
        end 
    end 

    def authenticated? 

        try_get_jwt_token.present?
    end 

    def auth_response_json(user)

        { token: make_token(user.id), username: user.username, user_id: user.id }
    end 

    def notify_unauthorized_user 
        render :json => { unauthorized: true }, :status => :unauthorized 
    end 

    private 

    def make_token(user_id)

        JWT.encode({ user_id: user_id }, ENV["JWT_SECRET_KEY"], 'HS256')
    end 

    def decode_token(token_string)
        JWT.decode(token_string, ENV["JWT_SECRET_KEY"], true, { algorithmL 'HS256'})

    end

    def try_get_jwt_token
        token_string = request.headers["Authorization"]
        if token_string.present?
            begin
                decoded_token = decode_token(token_string)
            rescue JWT::VerificationError
                return nil
            end 
            return decoded_token.first

        else 
            nil 
        end 
    end
end 
