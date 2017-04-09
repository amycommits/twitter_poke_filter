json.extract! area_notification, :id, :name, :latitude, :longitude, :lower_left_latitude, :lower_left_longitude, :upper_right_latitude, :upper_right_longitude, :created_at, :updated_at
json.url area_notification_url(area_notification, format: :json)
