module MyExpenses
  class ExpenseController < MyExpensesBase
    before '/*' do
      protected!
    end

    get '/month' do
      categories = find_categories_for_current_user
      @expenses  = find_expenses_between_dates_by_categories(
        categories.map(&:name),
        current_month_date_range
      )
      @sum_for_month        = find_sum_between_dates(current_month_date_range)
      @expenses_chart_array = create_array_for_expenses_chart(categories, @expenses)
      haml :expenses_for_month
    end

    get '/add' do
      @categories = find_categories_for_current_user
      haml :add_expense
    end

    post '/add' do
      date        = string_to_date(params[:date])
      category    = find_category(params[:category])
      price       = params[:price].to_f.round 2
      @error      = create_expense(params[:product], params[:description], price, date, category)
      if @error
        @categories = find_categories_for_current_user
        haml :add_expense
      else
        redirect '/expenses/month'
      end
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers DataBaseHelpers::CategoryHelpers, DataBaseHelpers::ExpenseHelpers, DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
