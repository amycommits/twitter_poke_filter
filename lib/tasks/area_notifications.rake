namespace :area_notifications do
  desc "creating area notifications"
  task :new, [:name,:latitude,:longitude] => :environment do |t, args|
    @area = args[:name]
    @latitude = args[:latitude].to_f
    @longitude = args[:longitude].to_f

    @distance = 0.5
    @boundingBox = Geocoder::Calculations.bounding_box([@latitude, @longitude],@distance)
    AreaNotification.create(name: @area, latitude: @latitude, longitude: @longitude, lower_left_latitude: @boundingBox[0], lower_left_longitude: @boundingBox[1], upper_right_latitude: @boundingBox[2], upper_right_longitude: @boundingBox[3])
  end
end
