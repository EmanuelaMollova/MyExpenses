module MyExpenses
  module DataBaseHelpers
    module CategoryHelpers
      def find_categories_for_user(user = session[:username])
        Category.all(user: { username: user })
      end

      def find_category(name)
        Category.last(name: name, user: { username: session[:username]})
      end
    end
  end
end
