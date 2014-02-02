module MyExpenses
  class WebsiteController < MyExpensesBase
    helpers AuthenticationHelpers

    get '/' do
      redirect '/user/login' if not user_logged?
    end
  end
end
