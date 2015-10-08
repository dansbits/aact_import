require_relative "setup"

files_to_import = %w[clinical_study facilities facility_contacts investigators overall_officials central_contacts
                     nct_aliases links sponsors designs responsible_parties keywords references conditions
                     removed_countries location_countries authorities]

files_to_import.each do |file|
  p "Importing file: #{file}"
  TextFileProcessor.new(file).process
end

DB.disconnect
