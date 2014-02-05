module MyExpenses
  module DataBaseHelpers
    module UserHelpers
      def find_user_by_username_and_password(username, password)
        User.all(username: username).select do |user|
          user.password == password
        end
      end
    end
  end
end
