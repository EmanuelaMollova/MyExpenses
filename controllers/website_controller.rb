module MyExpenses
  class WebsiteController < MyExpensesBase
    get '/' do
      haml :home
    end
  end
end
