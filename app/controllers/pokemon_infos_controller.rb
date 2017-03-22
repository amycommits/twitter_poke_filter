require 'twitter'
require 'net/http'

class PokemonInfosController < ApplicationController
  before_action :set_pokemon_info, only: [:show, :edit, :update, :destroy]

  # GET /pokemon_infos
  # GET /pokemon_infos.json
  def index
    call_tweets("PGANVANoVACrysc")
    call_tweets("pogodcdowntown")
    call_tweets("PoGoNoVaArlingt")
    call_tweets("PoGoNoVaAlexand")
    PokemonInfo.delete(PokemonInfo.expired.ids)
    @dratini = PokemonInfo.dratini.current_spawn.order(despawns_at: :desc)
    @not_dratini = PokemonInfo.not_dratini.current_spawn.order(despawns_at: :desc)
  end
  def get_long_url(short_url)
      uri = URI.parse(short_url)
      http = Net::HTTP.new(uri.host)
      response = http.get(uri.path)
      response.fetch('location')
    end

    def call_tweets(channelName)
      client = Twitter::REST::Client.new do |config|
        config.consumer_key = "Xve1T2O4owO8cDiQlp10ij00B"
        config.consumer_secret = "NRwTAUcHf7U447FEOdR7OK2F6jjxx6iWtC5JDBFQ7Orc19g6ZB"
        config.access_token = "844589234614915072-3vigvPAnatkdOQtWY1P3q4ZhyS4T1WK"
        config.access_token_secret = "56rc02MsMoAMsww19LaBzeAVV83t4MzLYVJVmK7c7AZuA"
      end
      @channelName = channelName
      puts "from:"+@channelName+" Snorlax OR Larvitar OR Dratini OR 100"
      @tweets = client.search("from:"+@channelName+" Snorlax OR Larvitar OR Dratini OR Blissey OR Chansey OR Tyranitar OR Pupitar OR Dragonite OR Dragonair OR Lapras OR 100", result_type: "recent").take(10).collect
      # @tweets = client.search("from:PGANVANoVACrysc Snorlax OR Larvitar OR Dratini OR 100", result_type: "recent").take(10).collect

      @tweets.each do |tweet|

        if (!PokemonInfo.find_by(description: tweet.text))

          @short_url = tweet.text[(tweet.text.rindex(' ')+1)..tweet.text.length]
          @long_url = get_long_url(@short_url)
          @pokemon_name = tweet.text[0,tweet.text.index(" ")]
          @despawn_time = DateTime.parse(tweet.text[(tweet.text.index("until ")+6),10])
          @today = DateTime.now
          @despawns_at = DateTime.new(@today.year, @today.month, @today.day, @despawn_time.hour, @despawn_time.minute, @despawn_time.sec)
          if (!(@despawns_at < Time.now - 4.hours)  )
            if(@pokemon_name != 'Dratini' && @pokemon_name != 'Dragonair')
              client.retweet(tweet.id)
            end
            PokemonInfo.create(description: tweet.text, short_url: @short_url, long_url: @long_url, pokemon_name: @pokemon_name, despawns_at: @despawns_at, channel: @channelName )
          end
        end
      end

    end
  # GET /pokemon_infos/1
  # GET /pokemon_infos/1.json
  def show
  end

  # GET /pokemon_infos/new
  def new
    @pokemon_info = PokemonInfo.new
  end

  # GET /pokemon_infos/1/edit
  def edit
  end

  # POST /pokemon_infos
  # POST /pokemon_infos.json
  def create
    @pokemon_info = PokemonInfo.new(pokemon_info_params)

    respond_to do |format|
      if @pokemon_info.save
        format.html { redirect_to @pokemon_info, notice: 'Pokemon info was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon_info }
      else
        format.html { render :new }
        format.json { render json: @pokemon_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemon_infos/1
  # PATCH/PUT /pokemon_infos/1.json
  def update
    respond_to do |format|
      if @pokemon_info.update(pokemon_info_params)
        format.html { redirect_to @pokemon_info, notice: 'Pokemon info was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon_info }
      else
        format.html { render :edit }
        format.json { render json: @pokemon_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemon_infos/1
  # DELETE /pokemon_infos/1.json
  def destroy
    @pokemon_info.destroy
    respond_to do |format|
      format.html { redirect_to pokemon_infos_url, notice: 'Pokemon info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon_info
      @pokemon_info = PokemonInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_info_params
      params.require(:pokemon_info).permit(:pokemon_name, :despawns_at, :iv_value, :channel, :coordinates, :latitude, :longitude, :short_url, :long_url, :description)
    end
end
