module MyExpenses
  class WebsiteController < MyExpensesBase
    get '/' do
      redirect '/user/login' if not user_logged?
      redirect '/expenses/month'
    end

    helpers AuthenticationHelpers
  end
end
