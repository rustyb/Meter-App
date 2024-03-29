class ProtectedStructure < ActiveRecord::Base
  extend FriendlyId
  friendly_id :ref_and_townland, use: :slugged
  has_one :niah, :foreign_key => :reg_number, :primary_key => :niah_ref
  acts_as_gmappable :process_geocoding => false
  reverse_geocoded_by :latitude, :longitude #don't bother trying to geocode when changed
  attr_accessible :rps_number, :structure_name, :description, :street_number, :street_address, :townland, :niah_ref, :rmp_ref, :longitude, :latitude
  
  include Rails.application.routes.url_helpers
  def gmaps4rails_infowindow
       "<b>#{self.rps_number} - #{(self.structure_name).to_s.gsub('"','\"')}</b> <p>#{(self.description).to_s.gsub('"','\"')}<br /><b><a href='#{protected_structure_url(self.slug, :only_path => true) }'>Get More Info</a></b></p>"  # add here whatever text you desire
  end
  
  def gmaps4rails_title
       "#{self.rps_number}"  # add here whatever text you desire
  end
  
  def ref_and_townland
    "#{rps_number} in #{townland}"
  end
end
