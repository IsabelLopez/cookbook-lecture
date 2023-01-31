class Patient
  attr_reader :name, :cured
  attr_accessor :room, :id

  def initialize(attr={})
    @name = attr[:name]
    @cured = attr[:cure] || false  #this means that is we don't initialize it with a cured attr its going to be false by default
    @blood_type = attr[:blood_type]
    @room = attr[:room]
    @id = attr[:id]
  end

  def cure!
    @cured = true
  end
end

john = Patient.new(name: 'john')
p john
# I can initialize a patient without passing all the attributes!!
# --> <Patient:0x00007f7fd4153b40 @name="john", @cured=false, @blood_type=nil>
