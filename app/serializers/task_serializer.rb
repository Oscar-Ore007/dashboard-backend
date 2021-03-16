class TaskSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :list_id 


end
