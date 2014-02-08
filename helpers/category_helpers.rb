module MyExpenses
  module DataBaseHelpers
    module CategoryHelpers
      def create_category(name)
        category = Category.new(name: name, user: find_current_user)
        to_sentence(category.errors) if !category.save
      end

      def find_categories_for_current_user
        Category.all(user: { username: session[:username] })
      end

      def find_category(name)
        Category.last(name: name, user: { username: session[:username]})
      end
    end
  end
end
