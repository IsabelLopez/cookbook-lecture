require "csv"
require_relative "patient"

class RoomRepository
  # i need to pass now the room_repository so I can have access to it
  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
  end

  def find(index)
    @rooms[index]
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # converting a string to integer (id)
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i  # Convert column to Integer
      @rooms << Room.new(row)
    end
    # we need to increment the next_id so patients id will increment every time we save them
    # if @patients.empty?
    #   @next_id = 1
    # else
    #   @next_id = @patients.last.id += 1
    # end
     @next_id = @rooms.empty? ? 1 : @rooms.last.id += 1
  end
end
