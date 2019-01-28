class PlayersController < ApplicationController

  get '/players' do
    if logged_in?
      @player_array = []
      Player.all.each do |p|
        if p.user_id == current_user.id
          @player_array << p
        end
      end
      if @player_array.empty?
        flash[:message] = "You are not tracking any Players!"
        redirect '/players/new'
      else
      erb :'/players/players'
      end
    else
      redirect 'index'
    end
  end

  get '/players/new' do
    @players = Player.all
    erb :'players/new'
  end

  post '/players' do
    if !(params.has_value?(""))
      @player = Player.create(params)
      @player.user_id = current_user.id
      @player.save
      redirect '/players'
    else
      flash[:error] = "Please fill in all fields"
      redirect '/players/new'
    end
  end

  get '/players/:id' do
    if logged_in?
      @player = Player.find(params[:id])
      if @player.user_id == current_user.id
        erb :'/players/show'
      else
        redirect '/players'
      end
    else
      redirect '/login'
    end
  end

  delete '/players/:id/delete' do
    @player = Player.find_by_id(params[:id])
    @player.destroy
    redirect '/players'
  end

  get '/players/:id/edit' do
    @player = Player.find_by_id(params[:id])
    erb :'/players/edit'
  end

  patch '/players/:id' do
    @player = Player.find_by_id(params[:id])
    @player.team = params[:team]
    @player.cost = params[:cost]
    @player.quantity = params[:quantity]
    @player.save
    redirect to "/players/#{@player.id}"
  end
end
