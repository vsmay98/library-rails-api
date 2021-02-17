class User < ApplicationRecord
  has_many :book_copies

  validates :first_name, :last_name, :email, presence: true

  def have_borrowed_book?
    self.book_copies.exists?
  end
end
