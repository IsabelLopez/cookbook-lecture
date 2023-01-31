# this is JUST A TEST FILE!!
# after it works we pass it to a repository method!

require 'csv'
require_relative 'patient'
patients = []
csv_file = 'patients.csv'

CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
  row[:id]    = row[:id].to_i          # Convert column to Integer
  row[:cured] = row[:cured] == "true"  # Convert column to boolean
  patients << Patient.new(row)
end

p patients

