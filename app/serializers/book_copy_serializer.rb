class BookCopySerializer < ActiveModel::Serializer
  attributes :id, :book_title, :user, :isbn, :published, :format

  def book_title
    object.book.title
  end

  def user
    return unless object.user
    instance_options[:without_serializer] ? object.user : UserSerializer.new(object.user, without_serializer: true)
  end
end
