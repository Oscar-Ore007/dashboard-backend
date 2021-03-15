class UsersController < ApplicationController
    attr_accessor :passsword

    # def authenticate(plaintext_passwprd)
    #   if BCrypt::Password.new(self.password_digest) == plaintext_passwprd
    #     self 
    #   else
    #     false
    #   end
    # end

    def index 
        @users = User.all
        render json: @users 
    end 

    def show 
        @user = User.find(params[:id])

        render json: @user 
    end 


  
    def create 
        get_users_params 
            
        @user = User.create(@user_params)
      if user.valid?
        render json: { user: UserSerializer.new(@user) }, status: :created
      else
        render json: { error: @user.errors.full_messages }, status: :not_acceptable
      end
    end

    def authenticate(plaintext_passwprd)
        if BCrypt::Password.new(self.password_digest) == plaintext_passwprd
            self
        else 
            false 
        end 
    end 
  
    private
    def get_user_params
        params.permit(:name, :username)
        @user_params = { name: params[:name], username: params[:username]}
    end
  end
