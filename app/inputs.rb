module Dre
  h_correct = lambda do |d|
    print "Install this '#{d[0]}.#{d[1]}' module? (y/n): "
    input = STDIN.gets.chomp
    result = false

    if input.downcase.index("y")
      result = true
    end
    return result
  end

  DragonrubyEgg::Event.add(:input_correct, h_correct)
end