require 'test_helper'

class TwitterFilterPokemonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twitter_filter_pokemon = twitter_filter_pokemons(:one)
  end

  test "should get index" do
    get twitter_filter_pokemons_url
    assert_response :success
  end

  test "should get new" do
    get new_twitter_filter_pokemon_url
    assert_response :success
  end

  test "should create twitter_filter_pokemon" do
    assert_difference('TwitterFilterPokemon.count') do
      post twitter_filter_pokemons_url, params: { twitter_filter_pokemon: { channel: @twitter_filter_pokemon.channel, coordinates: @twitter_filter_pokemon.coordinates, description: @twitter_filter_pokemon.description, despawns_at: @twitter_filter_pokemon.despawns_at, iv_value: @twitter_filter_pokemon.iv_value, latitude: @twitter_filter_pokemon.latitude, long_url: @twitter_filter_pokemon.long_url, longitude: @twitter_filter_pokemon.longitude, name: @twitter_filter_pokemon.name, short_url: @twitter_filter_pokemon.short_url } }
    end

    assert_redirected_to twitter_filter_pokemon_url(TwitterFilterPokemon.last)
  end

  test "should show twitter_filter_pokemon" do
    get twitter_filter_pokemon_url(@twitter_filter_pokemon)
    assert_response :success
  end

  test "should get edit" do
    get edit_twitter_filter_pokemon_url(@twitter_filter_pokemon)
    assert_response :success
  end

  test "should update twitter_filter_pokemon" do
    patch twitter_filter_pokemon_url(@twitter_filter_pokemon), params: { twitter_filter_pokemon: { channel: @twitter_filter_pokemon.channel, coordinates: @twitter_filter_pokemon.coordinates, description: @twitter_filter_pokemon.description, despawns_at: @twitter_filter_pokemon.despawns_at, iv_value: @twitter_filter_pokemon.iv_value, latitude: @twitter_filter_pokemon.latitude, long_url: @twitter_filter_pokemon.long_url, longitude: @twitter_filter_pokemon.longitude, name: @twitter_filter_pokemon.name, short_url: @twitter_filter_pokemon.short_url } }
    assert_redirected_to twitter_filter_pokemon_url(@twitter_filter_pokemon)
  end

  test "should destroy twitter_filter_pokemon" do
    assert_difference('TwitterFilterPokemon.count', -1) do
      delete twitter_filter_pokemon_url(@twitter_filter_pokemon)
    end

    assert_redirected_to twitter_filter_pokemons_url
  end
end
