class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :books

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
