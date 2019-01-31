require 'rack-flash'

class UsersController < ApplicationController

  configure do
    use Rack::Flash
  end

  get '/signup' do
    if logged_in?
      redirect '/players'
    else
      @user = User.new
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      erb :'/players/players'
    else
      erb :'/users/signup'
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
