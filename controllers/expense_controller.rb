module MyExpenses
  class ExpenseController < MyExpensesBase
    before '/*' do
      protected!
    end

    get '/' do
      @categories = find_categories_for_user
      haml :expenses
    end

    post '/' do
      date = DateTime._strptime(params[:date], '%m/%d/%Y')
      expense = Expense.new(
        product: params[:product],
        description: params[:description],
        price: params[:price],
        date: DateTime.new(date[:year], date[:mon], date[:mday]),
        user: find_user,
        category: find_category(params[:category])
      )
      set_message(to_sentence(expense.errors), :expenses) if !expense.save
      @categories = find_categories_for_user
      @expenses = Expense.all
      haml :expenses
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers DataBaseHelpers::CategoryHelpers, DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
