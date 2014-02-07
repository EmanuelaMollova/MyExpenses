module MyExpenses
  class Category
    include DataMapper::Resource

    property :id, Serial

    property :name, String,
      length: 3..25,
      unique: true,
      messages: {
        length: "The name should be between 3 and 25 symbols.",
        is_unique: "This name already exists."
      }

    belongs_to :user
  end
end
