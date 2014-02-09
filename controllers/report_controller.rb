module MyExpenses
  class ReportController < MyExpensesBase
    before '/*' do
      protected!
    end

    get '/' do
      @categories = find_categories_for_current_user
      @no_categories = true if @categories.empty?
      haml :report_form
    end

    post '/' do
      categories = params[:categories]
      start_date = params[:start_date]
      end_date   = params[:end_date]
      @error = no_categories(categories) or
               no_dates(start_date, end_date) or
               no_valid_range(start_date, end_date)
      unless @error
        date_range = start_date..end_date
        @expenses  = find_expenses_between_dates_by_categories(categories, date_range)
        if @expenses.all?(&:empty?)
          @error   = "There are no such expenses."
        else
          @total_sum          = find_sum_between_dates(date_range)
          @report_chart_array = create_array_for_expenses_chart(categories, @expenses)
        end
        haml :report_reply
      else
        @categories = find_categories_for_current_user
        haml :report_form
      end
    end

    helpers AuthenticationHelpers, WebsiteHelpers, ReportHelpers
    helpers DataBaseHelpers::CategoryHelpers, DataBaseHelpers::ExpenseHelpers, DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
