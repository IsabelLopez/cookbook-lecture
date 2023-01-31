require 'csv'
require_relative 'patient'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    # next id will be used to increment the ids on our repository
    @next_id =  1
    @patients = []
    @room_repository = room_repository
  end

  def add(patient)
    # patient.id (@id on patient model)
    patient.id = @next_id
    # save_csv --> TO DO
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # converting a string to integer (id)
      row[:id]    = row[:id].to_i          # Convert column to Integer
      # converting a string to boolean (cured)
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      patient = Patient.new(row)
      # I need to go to the room repo and look for the room
      room = @room_repo.find(row[:id].to_i)
      # assign that room to my patient
      patient.room = room

      @patients << patient

    end
    # we need to increment the next_id so patients id will increment every time we save them
    # if @patients.empty?
    #   @next_id = 1
    # else
    #   @next_id = @patients.last.id += 1
    # end
     @next_id = @patients.empty? ? 1 : @patients.last.id += 1
  end

  # TO DO --> SAVE CSV
end

csv_file = 'patients.csv'
csv_file_room = 'rooms.csv'
# create a new repo
room_repo = RoomRepository.new(csv_file_room)
# create a new repo and pass also the room_repo so I can have access to it!
repo = PatientRepository.new(csv_file, room_repo)
# create a new patient
john = Patient.new(name: 'john')

p repo.add(john)

