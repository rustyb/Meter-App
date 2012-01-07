desc "Import niah data from csv file"
task :import_niah_csv => [:environment] do
  require 'csv' 

  file = "db/fcc_niah.csv"
  #p "Starting to import CSV data from #{file}." 

  CSV.foreach(file, {:headers => true, :row_sep => :auto}) do |row|
    Niah.create!(
    :reg_number => row[0],
    :rating => row[1],
    :number => row[2],
    :name => row[3],
    :street1 => row[4],
    :street2 => row[5],
    :town => row[6],
    :county => row[7],
    :townland => row[8], 
    :building_type => row[9].to_s.gsub('/',' '),
    :year_from => row[10],
    :year_to => row[11],
    :composition => row[12],
    :appraisal => row[13],
    :web_link => row[14], 
    :image_link => row[15], 
    :longitude => row[16],
    :latitude => row[17] )
  end
end

#create the db
#:reg_number, :rating,:number,:name,:street1,:street2,:town,:county,:townland,:building_type,:year_from,   :year_to,   :composition,   :appraisal,   :web_link,   :image_link,   :longitude, :latitude