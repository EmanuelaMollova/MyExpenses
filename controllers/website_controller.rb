module MyExpenses
  class WebsiteController < MyExpensesBase
    get '/' do
      erb :home
    end
  end
end
