class ProtectedStructure < ActiveRecord::Base
  acts_as_gmappable :process_geocoding => false
  reverse_geocoded_by :latitude, :longitude #don't bother trying to geocode when changed
  attr_accessible :rps_number, :structure_name, :description, :street_number, :street_address, :townland, :niah_ref, :rmp_ref, :longitude, :latitude
  
  def gmaps4rails_infowindow
       "#{self.rps_number} - #{(self.structure_name).to_s.gsub('"','\"')} <p>#{(self.description).to_s.gsub('"','\"')}</p>"  # add here whatever text you desire
  end
  
end
