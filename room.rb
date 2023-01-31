require_relative "patient"

class Room
  attr_accessor :id

  def initialize(attr={})
    # 0 by default if we dont give a capacity
    @capacity = attr[:capacity] || 0
    # [] by default
    @patients = attr[:patients] || []
    @id = attr[:id]
  end

  def add(patient)
    # this if statement can be transformed with and Exception
    # if full?
    #   #error
    # else
    #   # run code
    #   patient.room = self
    #   @patients << patient
    # end

    # raise error with Exception ->
    raise StandardError, "Room is full!" if full?

    # self: refers to the instance of room I'm calling the method on
    # patient.room = asigning the room to a patient
    patient.room = self
    @patients << patient
  end

  def full?
    @patients.size == @capacity
  end

end

room = Room.new(capacity: 2)
# Require relative patient so we can run this:
sarah = Patient.new(name: 'sarah')

# adding sarah to my room
p room.add(sarah)
# [#<Patient:0x00007fea98829b48 @name="sarah", @cured=false, @blood_type=nil, @room=#<Room:0x00007fea98829c10 @capacity=2, @patients=[...], @id=nil>>

# want to know what room sarah is
p sarah.room
# <Room:0x00007fea98829c10 @capacity=2, @patients=[#<Patient:0x00007fea98829b48 @name="sarah", @cured=false, @blood_type=nil, @room=#<Room:0x00007fea98829c10 ...>>], @id=nil>
