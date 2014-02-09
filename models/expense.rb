module MyExpenses
  class Expense
    include DataMapper::Resource

    property :id, Serial
    property :product, String
    property :description, Text
    property :price, Float
    property :date, Date

    belongs_to :user
    belongs_to :category
  end
end
