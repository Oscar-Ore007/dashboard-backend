class ListSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :project_id 

  attributes :tasks do |list| 
  list.tasks
  end
end 
