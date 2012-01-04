desc "Import parking meters from csv file"
task :import_csv => [:environment] do
  require 'csv' 

  file = "db/dublin_parking_full.csv"
  #p "Starting to import CSV data from #{file}." 

  CSV.foreach(file, {:headers => true, :row_sep => :auto}) do |row|
    Meter.create!( 
      :dublin_no => row[1], 
      :location => row[2], 
      :code => row[3], 
      :spaces => row[4], 
      :exact_location => row[5], 
      :installed => row[6], 
      :tariff => row[7], 
      :nearest_pad => row[8],
      :op_hours => row[9],
      :clearway => row[10],
      :clearway_hours => row[11],
      :comment => row[12],
      :further_info => row[13],
      :finished => row[14],
      :extra_comment => row[15], 
      :zone => row[16], 
      :longitude => row[17], 
      :latitude => row[18])
  end
end