class UsersController < ApplicationController
    attr_accessor :passsword

    def authenticate(plaintext_passwprd)
      if BCrypt::Password.new(self.password_digest) == plaintext_passwprd
        self 
      else
        false
      end
    end
  
    def create 
      @user = User.create(user_params)
      if user.valid?
        render json: { user: UserSerializer.new(@user) }, status: :created
      else
        render json: { error: params.errors.full_messages }, status: :not_acceptable
      end
    end
  
    private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
  end
