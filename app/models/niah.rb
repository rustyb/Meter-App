class Niah < ActiveRecord::Base
  set_primary_key :reg_number
  
  attr_accessible :reg_number, :rating,:number,:name,:street1,:street2,:town,:county,:townland,:building_type,:year_from,   :year_to,   :composition,   :appraisal,   :web_link,   :image_link,   :longitude, :latitude
end
