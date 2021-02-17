FactoryBot.define do
  factory :book_copy do
    sequence(:isbn) { |i| "0000#{i}" }
    format {'hardback'}
    published {Date.today - 1.day}
    association(:book)
  end
end