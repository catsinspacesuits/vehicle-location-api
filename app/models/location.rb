class Location < ApplicationRecord
  belongs_to :vehicle

  def get_distance_from_office
  	office_coordinates = [52.53, 13.403]
	Geolocation.new.calculate_distance(office_coordinates, [lat, lng])/1000 # converts to km
  end
end
