desc "Import parking meters from csv file"
task :import_ps_csv => [:environment] do
  require 'csv' 

  file = "db/fingal_protected_structures.csv"
  #p "Starting to import CSV data from #{file}." 

  CSV.foreach(file, {:headers => true, :row_sep => :auto}) do |row|
    ProtectedStructure.create!(
    :rps_number => row[0],
    :structure_name => row[1],
    :description => row[2],
    :street_number => row[3],
    :street_address => row[4],
    :townland => row[5],
    :niah_ref => row[6],
    :rmp_ref => row[7],
    :longitude => row[9], 
    :latitude => row[8])
  end
end

#create the db
#protected_structures rps_number:integer structure_name:string description:text street_number:string street_address:string townland:string niah_ref:integer rmp_ref:integer longitude:float latitude:float