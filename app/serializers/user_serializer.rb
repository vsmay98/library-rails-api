class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :have_book_copies, :book_copies

  def have_book_copies
    object.have_borrowed_book?
  end
end
