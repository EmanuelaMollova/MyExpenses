module MyExpenses
  module DataBaseHelpers
    module ExpenseHelpers
      def create_expense(product, description, price, date, category)
        expense = Expense.new(
          product:     product,
          description: description,
          price:       price,
          date:        date,
          user:        find_current_user,
          category:    category
        )
        to_sentence(expense.errors) if !expense.save
      end

      # def find_expenses_by_categories(categories)
      #   categories.map do |category|
      #     Expense.all(
      #       category: { name: category.name },
      #       user: { username: session[:username] }
      #     )
      #   end
      # end

      def find_expenses_between_dates_by_categories(categories, date_range)
        categories.map do |category|
          Expense.all(
            category: { name: category.name },
            user:     { username: session[:username] },
            date:     date_range
          )
        end
      end

      def find_sum_between_dates(date_range)
        Expense.sum(:price, user: { username: session[:username] }, date: date_range)
      end
    end
  end
end
