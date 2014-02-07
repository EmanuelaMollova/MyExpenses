module MyExpenses
  class CategoryController < MyExpensesBase
    before '/*' do
      protected!
    end

    get '/' do
      @categories = find_categories_for_user
      haml :categories
    end

    post '/' do
      category = Category.new(name: params[:name], user: find_user)
      set_message(to_sentence(category.errors), :categories) if !category.save
      @categories = find_categories_for_user
      haml :categories
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers DataBaseHelpers::CategoryHelpers, DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
