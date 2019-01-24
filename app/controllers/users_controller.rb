class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !(params.has_value?(""))
      @players = Player.all
      @user = User.create(params)
      session[:user_id] = @user.id

      erb :'/players/players'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/players'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    login(params["email"], params["password"])
  end


  get '/logout' do
    session.destroy
    redirect '/'
  end
end
