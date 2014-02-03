module MyExpenses
  class User
    include DataMapper::Resource

    property :id, Serial

    property :username, Text,
      length: 3..15,
      unique: true,
      messages: {
        length: "Your username should be between 3 and 15 symbols.",
        is_unique: "This username is already taken."
      }

    property :encrypted_password, Text

    attr_encryptor :password, :key => 'this is a very secret key'
  end
end
