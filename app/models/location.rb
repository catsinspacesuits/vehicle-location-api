class Location < ApplicationRecord
  belongs_to :vehicle
  validate :vehicle_must_be_within_city_limits
  # calculated distance between office and vehicle
  def get_distance_from_office
  	office_coordinates = [52.53, 13.403]
	Geolocation.new.calculate_distance(office_coordinates, [lat, lng])/1000 # converts to km
  end
  # ensures vehicles over 3.5km from office are not saved 
  def vehicle_must_be_within_city_limits
	if Location.get_distance_from_office > 3.5
	  errors.add(:vehicle_id, "is not within city limits")
	end
  end
end

