require "./Room"
require "./StandardResponse.rb"

class Kitchen < Room
  def initialize
    super(
      'Kitchen',
      'a wild scene of hatches and flesh flying through the air. A skeleton with embers for eyes at the center',
      'a bustling kitchen'
    )
  end

  def act
    look('a juicy piece of meat. Man you\'re hungry. Take the meat? (T)')
    look('a cleaver on the table. Attack the chef? (A)')
    action = action(['T', 'A'])
    case action
    when 'T'
      too_much_food
    when 'A'
      poor_chef
    end
  end

  def too_much_food
    puts 'You sneakily grab the haunch of meat and take a bite. An intense wave of gluttony overcomes you. You stand there and eat and eat and eat. You notice the undead chef keeps the meat coming. It\'s your last thought.'
    StandardResponse.bad_end
  end

  def poor_chef
    puts 'You grab the cleaver, yell, and charge at the Chef. Swinging wildly with your eyes shut. You connect! You strike again and again. You open eyes to bask in your victory, but are met with the chef\'s face of sadness. It sulks and mumbles, "I just want to cook good food."'
    puts 'A bit baffled you feel bad and put down the cleaver.'
    decide
  end
end
