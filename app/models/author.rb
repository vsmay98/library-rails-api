class Author < ApplicationRecord
  has_many :books

  validates :first_name, :last_name, presence: true

  def list_book_names
    self.books.pluck(:title)
  end

  def name_validate
    return "Invalid First Name" unless self.valid?

    "#{self.first_name} valid"
  end
end
