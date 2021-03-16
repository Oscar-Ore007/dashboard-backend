class UserSerializer < ActiveModel::Serializer 
    include FastJsonapi::ObjectSerializer 
    attributes :id, :name, :username, :email

    attribute :projects do |user|
        user.projects
    end 
end 