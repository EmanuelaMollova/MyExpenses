module MyExpenses
  class AuthenticationController < MyExpensesBase
    get '/register' do
      haml :register
    end

    get '/login' do
      haml :login
    end

    post '/register' do
      @error =
        short_password(params[:password]) or
        passwords_dont_match(params[:password], params[:repeated_password])
      if !@error
        user = User.new(username: params[:username], password: params[:password])
        if !user.save
          set_message(to_sentence(user.errors), :register)
        else
          set_message("Your registration was successful.", :login, :success)
        end
      else
        haml :register
      end
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
