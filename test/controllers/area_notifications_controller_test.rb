require 'test_helper'

class AreaNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_notification = area_notifications(:one)
  end

  test "should get index" do
    get area_notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_area_notification_url
    assert_response :success
  end

  test "should create area_notification" do
    assert_difference('AreaNotification.count') do
      post area_notifications_url, params: { area_notification: { latitude: @area_notification.latitude, longitude: @area_notification.longitude, lower_left_latitude: @area_notification.lower_left_latitude, lower_left_longitude: @area_notification.lower_left_longitude, name: @area_notification.name, upper_right_latitude: @area_notification.upper_right_latitude, upper_right_longitude: @area_notification.upper_right_longitude } }
    end

    assert_redirected_to area_notification_url(AreaNotification.last)
  end

  test "should show area_notification" do
    get area_notification_url(@area_notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_notification_url(@area_notification)
    assert_response :success
  end

  test "should update area_notification" do
    patch area_notification_url(@area_notification), params: { area_notification: { latitude: @area_notification.latitude, longitude: @area_notification.longitude, lower_left_latitude: @area_notification.lower_left_latitude, lower_left_longitude: @area_notification.lower_left_longitude, name: @area_notification.name, upper_right_latitude: @area_notification.upper_right_latitude, upper_right_longitude: @area_notification.upper_right_longitude } }
    assert_redirected_to area_notification_url(@area_notification)
  end

  test "should destroy area_notification" do
    assert_difference('AreaNotification.count', -1) do
      delete area_notification_url(@area_notification)
    end

    assert_redirected_to area_notifications_url
  end
end
