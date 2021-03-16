class TaskSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :list_id 

  attributes :lists do |task| 
    task.list.name 
  end 
end
