class TodoSerializer < ActiveModel::Serializer
  #limit the data that is being rendered
  attributes :id, :title, :description, :finished
end
