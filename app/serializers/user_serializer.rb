class UserSerializer < ActiveModel::Serializer 
    attributes :id, :name, :username, :email, :password

    attribute :projects do |user|
        user.projects
    end 
end 