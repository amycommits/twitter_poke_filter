require 'twitter'
require 'net/http'

namespace :find_pokemon do
  desc "Uses twitter API to get the latest Pokemon alerts"
  task :all => :environment do
    call_tweets("PGANVANoVACrysc")
    call_tweets("pogodcdowntown")
    call_tweets("PoGoNoVaArlingt")
    call_tweets("PoGoNoVaAlexand")
    puts Time.now
    TwitterFilterPokemon.delete(TwitterFilterPokemon.expired.ids)
  end
  task :substrings => :environment do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ""
      config.consumer_secret = ""
      config.access_token = ""
      config.access_token_secret = ""
    end
    @channelName = "PoGoNoVaArlingt"
    @tweets = client.search("from:"+@channelName+" Snorlax OR Larvitar OR Dratini OR Blissey OR Chansey OR Tyranitar OR Pupitar OR Dragonite OR Dragonair OR Lapras OR Unown OR Mareep OR Flaaffy OR Ampharos OR 100", result_type: "recent").take(15).collect
    @tweets.each do |tweet|
        @short_url = tweet.text[(tweet.text.rindex(' ')+1)..tweet.text.length]
        @long_url = get_long_url(@short_url)
        @pokemon_name = tweet.text[0,tweet.text.index(" ")]
        @despawn_time = DateTime.parse(tweet.text[(tweet.text.index("until ")+6),10])
        @today = DateTime.now
        @despawns_at = DateTime.new(@today.year, @today.month, @today.day, @despawn_time.hour, @despawn_time.minute, @despawn_time.sec)
        @iv_value = tweet.text[(tweet.text.rindex('(')+1)..(tweet.text.rindex('%')-1)]
          if(@pokemon_name != 'Dratini' && @pokemon_name != 'Dragonair')
              puts @pokemon_name
          elsif (@iv_value.to_f > 90)
              puts @pokemon_name
              puts @iv_value
          end
    end
  end
  def get_long_url(short_url)
      uri = URI.parse(short_url)
      http = Net::HTTP.new(uri.host)
      response = http.get(uri.path)
      response.fetch('location')
  end
  def call_tweets(channelName)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ""
      config.consumer_secret = ""
      config.access_token = ""
      config.access_token_secret = ""
    end
    @channelName = channelName
    @tweets = client.search("from:"+@channelName+" Snorlax OR Larvitar OR Dratini OR Blissey OR Chansey OR Tyranitar OR Pupitar OR Dragonite OR Dragonair OR Lapras OR Unown OR Mareep OR Flaaffy OR Ampharos OR 100", result_type: "recent").take(10).collect
    @tweets.each do |tweet|
      if (!PokemonInfo.find_by(description: tweet.text))
        @short_url = tweet.text[(tweet.text.rindex(' ')+1)..tweet.text.length]
        @long_url = get_long_url(@short_url)
        @pokemon_name = tweet.text[0,tweet.text.index(" ")]
        @despawn_time = DateTime.parse(tweet.text[(tweet.text.index("until ")+6),10])
        @today = DateTime.now
        @despawns_at = DateTime.new(@today.year, @today.month, @today.day, @despawn_time.hour, @despawn_time.minute, @despawn_time.sec)
        @iv_value = tweet.text[(tweet.text.rindex('(')+1)..(tweet.text.rindex('%')-1)]
        if (!(@despawns_at < Time.now - 4.hours)  )
          puts tweet.text
          if(@pokemon_name != 'Dratini' && @pokemon_name != 'Dragonair')
              client.update("#{@pokemon_name} #{@despawn_time.strftime("%I:%M:%S %p")} #{@channelName} #{@iv_value}%")
	            client.retweet(tweet.id)
          elsif (@iv_value.to_f > 93)
            client.update("#{@pokemon_name} #{@despawn_time.strftime("%I:%M:%S %p")} #{@channelName} #{@iv_value}%")
            client.retweet(tweet.id)
          end
          PokemonInfo.create(description: tweet.text, short_url: @short_url, long_url: @long_url, pokemon_name: @pokemon_name, despawns_at: @despawns_at, channel: @channelName )
          TwitterFilterPokemon.create(description: tweet.text, short_url: @short_url, long_url: @long_url, name: @pokemon_name, despawns_at: @despawns_at, channel: @channelName )
	       end
      end
    end
  end
end
