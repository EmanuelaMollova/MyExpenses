module MyExpenses
  class ReportController < MyExpensesBase
    before '/*' do
      protected!
    end

    get '/' do
      @categories = find_categories_for_current_user
      haml :report_form
    end

    post '/' do
      categories = params[:categories]
      @error = "Please selectat least one category" if !categories

      start_date = (string_to_date(params[:start_date]) or Date.today)
      end_date   = (string_to_date(params[:end_date]) or Date.today)
      @error = "The start date should be before the end date." if !date_range = start_date..end_date
      unless @error
        @expenses = find_expenses_between_dates_by_categories(categories, date_range)
        @total_sum = find_sum_between_dates(date_range)
        @report_chart_array = create_array_for_expenses_chart(categories, @expenses)
        haml :report_reply
      else
        @categories = find_categories_for_current_user
        haml :report_form
      end
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers DataBaseHelpers::CategoryHelpers, DataBaseHelpers::ExpenseHelpers, DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
