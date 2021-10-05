require "./Direction.rb"

class Path
  attr_reader :direction
  attr_reader :description
  attr_reader :room

  def initialize(direction, room)
    @direction = direction
    @description = "#{Direction::DESCRIPTION[direction]} #{room.far_description}"
    @room = room
  end
end
