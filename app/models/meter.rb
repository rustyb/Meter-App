class Meter < ActiveRecord::Base
  
  acts_as_gmappable :process_geocoding => false
  
  geocoded_by :location
  attr_accessible :dublin_no, :location, :code, :spaces, :exact_location, :installed, :tariff, :nearest_pad, :op_hours, :clearway, :clearway_hours, :comment, :further_info, :finished, :extra_comment, :zone, :longitude, :latitude
  validates_presence_of :location
  validates_uniqueness_of :location
  
  
  include Rails.application.routes.url_helpers
  default_url_options[:host] = 'www.therustyproject.com'
  def gmaps4rails_infowindow
    "<span style='font-size:1.2em;font-weight:bold;'>#{location} - #{dublin_no}</span><br/><b><a href='#{url_for(:controller => 'meters', :action => 'show', :id => "#{id}")}'>Get More Info</a></b>"
    #"<b>#{location} - #{dublin_no}</b><br /><a href='#{base_url}/meters/#{id}'>More Info</a>"
  end
  
  def gmaps4rails_marker_picture
    {
     "picture" => "/images/parking-meter-#{zone.downcase}-small.png",
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
