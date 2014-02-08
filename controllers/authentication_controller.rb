module MyExpenses
  class AuthenticationController < MyExpensesBase
    get '/register' do
      haml :register
    end

    get '/login' do
      haml :login
    end

    post '/register' do
      @error = passwords_dont_meet_criteria(params[:password], params[:repeated_password])
      unless @error
        @error = create_user(params[:username], params[:password])
        redirect '/user/login' unless @error
      end
      haml :register
    end

    post '/login' do
      user = find_user_by_username_and_password(params[:username], params[:password])
      if user.size == 1
        session[:username] = params[:username]
        redirect_home
      else
        set_message("Wrong username or password.", :login)
      end
    end

    get '/logout' do
      session.clear
      redirect_home
    end

    helpers AuthenticationHelpers, WebsiteHelpers
    helpers DataBaseHelpers::UserHelpers
    helpers ViewHelpers
  end
end
