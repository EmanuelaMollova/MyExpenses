module MyExpenses
  module DataBaseHelpers
    module UserHelpers
      def create_user(username, password)
        user = User.new(username: username, password: password)
        to_sentence(user.errors) if !user.save
      end

      def find_user_by_username_and_password(username, password)
        User.all(username: username).select do |user|
          user.password == password
        end
      end

      def find_user(username = session[:username])
        User.last(username: username)
      end
    end
  end
end
