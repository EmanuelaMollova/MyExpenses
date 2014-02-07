module MyExpenses
  module DataBaseHelpers
    module CategoryHelpers
      def find_categories_for_user(user = session[:username])
        Category.all(user: { username: user })
      end
    end
  end
end
