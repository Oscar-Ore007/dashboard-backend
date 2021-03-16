class ListSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :project_id 

  attributes :project do |list| 
  list.project.name 
  end
end 
