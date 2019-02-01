class PlayersController < ApplicationController

  get '/players' do
    if logged_in?
      @player_array = []
      Player.all.each do |player|
        if player.user_id == current_user.id
          @player_array << player
        end
      end
      erb :'/players/players'
    else
      redirect '/login'
    end
  end

  get '/players/new' do
    if logged_in?
      @players = Player.all
      @player = Player.new
      erb :'/players/new'
    else
      redirect '/login'
    end
  end

  post '/players' do
    @player = Player.new(:name => params[:name], :team => params[:team], :cost => params[:cost], :quantity => params[:quantity])
    if @player.valid?
      @player.user_id = current_user.id
      @player.save
      redirect "/players/#{@player.id}"
    else
      erb :'/players/new'
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
    if logged_in?
      @player = Player.find_by_id(params[:id])
      erb :'/players/edit'
    else
      redirect '/login'
    end
  end

  patch '/players/:id' do
    @player = Player.find_by_id(params[:id])
    @player.team = params[:team]
    @player.cost = params[:cost]
    @player.quantity = params[:quantity]
    if @player.valid?
      @player.save
      redirect to "/players/#{@player.id}"
    else
      erb :'players/edit'
    end
  end
end
