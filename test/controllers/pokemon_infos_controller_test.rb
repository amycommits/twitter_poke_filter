require 'test_helper'

class PokemonInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pokemon_info = pokemon_infos(:one)
  end

  test "should get index" do
    get pokemon_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_pokemon_info_url
    assert_response :success
  end

  test "should create pokemon_info" do
    assert_difference('PokemonInfo.count') do
      post pokemon_infos_url, params: { pokemon_info: { channel: @pokemon_info.channel, coordinates: @pokemon_info.coordinates, description: @pokemon_info.description, despawns_at: @pokemon_info.despawns_at, iv_value: @pokemon_info.iv_value, latitude: @pokemon_info.latitude, long_url: @pokemon_info.long_url, longitude: @pokemon_info.longitude, pokemon_name: @pokemon_info.pokemon_name, short_url: @pokemon_info.short_url } }
    end

    assert_redirected_to pokemon_info_url(PokemonInfo.last)
  end

  test "should show pokemon_info" do
    get pokemon_info_url(@pokemon_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_pokemon_info_url(@pokemon_info)
    assert_response :success
  end

  test "should update pokemon_info" do
    patch pokemon_info_url(@pokemon_info), params: { pokemon_info: { channel: @pokemon_info.channel, coordinates: @pokemon_info.coordinates, description: @pokemon_info.description, despawns_at: @pokemon_info.despawns_at, iv_value: @pokemon_info.iv_value, latitude: @pokemon_info.latitude, long_url: @pokemon_info.long_url, longitude: @pokemon_info.longitude, pokemon_name: @pokemon_info.pokemon_name, short_url: @pokemon_info.short_url } }
    assert_redirected_to pokemon_info_url(@pokemon_info)
  end

  test "should destroy pokemon_info" do
    assert_difference('PokemonInfo.count', -1) do
      delete pokemon_info_url(@pokemon_info)
    end

    assert_redirected_to pokemon_infos_url
  end
end
