class Meter < ActiveRecord::Base
  
  acts_as_gmappable :process_geocoding => false
  
  geocoded_by :location
  attr_accessible :dublin_no, :location, :code, :spaces, :exact_location, :installed, :tariff, :nearest_pad, :op_hours, :clearway, :clearway_hours, :comment, :further_info, :finished, :extra_comment, :zone, :longitude, :latitude
  validates_presence_of :location
  validates_uniqueness_of :location
  
  def gmaps4rails_infowindow
    "<b>#{location} - #{dublin_no}</b>"
  end
  
  def gmaps4rails_marker_picture
    {
     "picture" => "/images/parking-meter-small.png",
     "width" => "22",
     "height" => "25",
     "marker_anchor" => [ 5, 10],
     "shadow_picture" => "" ,
     "shadow_width" => "0",
     "shadow_height" => "0",
     "shadow_anchor" => [ 5, 10],
    }
  end
  
  #def gmaps4rails_sidebar
    
   # "<span class='foo'><b style='font-size:1.2em;'>#{location} #{dublin_no}</b><p><b>Operation Hours:</b><br />#{op_hours}<br/><b>Number of Spaces:</b><br />#{spaces}</p><div class='small #{zone.downcase} button radius'> #{zone} Zone</div> <div class='small black button radius'>&euro; #{tariff}0 per hour</div><br /></span>" #put whatever you want here
  #end
  
end
