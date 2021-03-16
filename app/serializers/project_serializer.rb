class ProjectSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user_id

  attribute :user do |project|
    project.user.name
  end

  attribute :lists do |project| 
    list_array = []

    project.lists.each.do |list| 
      list_obj = { 'id' => list.id, 'name' => list.name, 'task' => list.tasks }

      list_array << list_obj
    end 
  list_array 
  end 

end 
