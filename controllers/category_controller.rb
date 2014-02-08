module MyExpenses
  class CategoryController < MyExpensesBase
    before '/*' do
      protected!
    end

    get '/' do
      @categories = find_categories_for_current_user
      haml :categories
    end

    post '/' do
      @error = create_category(params[:name])
      @categories = find_categories_for_current_user
      haml :categories
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers DataBaseHelpers::CategoryHelpers, DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
