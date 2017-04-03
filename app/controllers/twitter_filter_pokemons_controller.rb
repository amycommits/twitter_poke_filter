require 'twitter'
require 'net/http'
class TwitterFilterPokemonsController < ApplicationController
  before_action :set_twitter_filter_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /twitter_filter_pokemons
  # GET /twitter_filter_pokemons.json
  def index

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "orFbcTc4YaVLkr80nIBJGob0u"
      config.consumer_secret = "XYHTfJEWhm0BUqigZyu7zFWzHX9ssgJwoncNCgUdPx7LYXrXer"
      config.access_token = "4683397465-jOeRXEutykkVmrjpCEna9x2de0KkHN9dEfVpCvT"
      config.access_token_secret = "QIyMQd584v2zLes1aWeh8BXKHgWQuM8p9UZz9yVxS4c9o"
    end
    @channelName = "pogodcdowntown"
    puts "from:"+@channelName+" Snorlax OR Larvitar OR Dratini OR 100"
    @tweets = client.search("from:"+@channelName+" Snorlax OR Larvitar OR Dratini OR Blissey OR Chansey OR Tyranitar OR Pupitar OR Dragonite OR Dragonair OR Lapras OR 100", result_type: "recent").take(10).collect

    puts @tweets
    puts @tweets.first


   puts "mmmmmmm"
   @tweets.each do |tweet|
     puts "--------------------"
     puts tweet.text
   end
  end

  # GET /twitter_filter_pokemons/1
  # GET /twitter_filter_pokemons/1.json
  def show
  end

  # GET /twitter_filter_pokemons/new
  def new
    @twitter_filter_pokemon = TwitterFilterPokemon.new
  end

  # GET /twitter_filter_pokemons/1/edit
  def edit
  end

  # POST /twitter_filter_pokemons
  # POST /twitter_filter_pokemons.json
  def create
    @twitter_filter_pokemon = TwitterFilterPokemon.new(twitter_filter_pokemon_params)

    respond_to do |format|
      if @twitter_filter_pokemon.save
        format.html { redirect_to @twitter_filter_pokemon, notice: 'Twitter filter pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @twitter_filter_pokemon }
      else
        format.html { render :new }
        format.json { render json: @twitter_filter_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitter_filter_pokemons/1
  # PATCH/PUT /twitter_filter_pokemons/1.json
  def update
    respond_to do |format|
      if @twitter_filter_pokemon.update(twitter_filter_pokemon_params)
        format.html { redirect_to @twitter_filter_pokemon, notice: 'Twitter filter pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter_filter_pokemon }
      else
        format.html { render :edit }
        format.json { render json: @twitter_filter_pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_filter_pokemons/1
  # DELETE /twitter_filter_pokemons/1.json
  def destroy
    @twitter_filter_pokemon.destroy
    respond_to do |format|
      format.html { redirect_to twitter_filter_pokemons_url, notice: 'Twitter filter pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_filter_pokemon
      @twitter_filter_pokemon = TwitterFilterPokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_filter_pokemon_params
      params.require(:twitter_filter_pokemon).permit(:name, :despawns_at, :iv_value, :channel, :coordinates, :latitude, :longitude, :short_url, :long_url, :description)
    end
end
