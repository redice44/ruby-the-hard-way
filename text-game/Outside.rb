require "./Room.rb"
require "./StandardResponse.rb"

class Outside < Room
  def initialize
    super(
      'Outside',
      'You feel a breeze of fresh air. You\'ve made it outside to the lush forest floor.',
      'a faint light.'
    )
  end

  def act
    look('your tent. Relax? (R)')
    look('a curious castle. Adventure? (A)')
    action = action(['R', 'A'])
    case action
    when 'R'
      StandardResponse.good_end
    end
  end

end
