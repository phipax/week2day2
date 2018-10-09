class Calculator

 def initialize
   @display = Display.new
 end
 def add(number_1,number_2)
   @display.print_answer(number_1+number_2)
 end
 def subtract(number_1,number_2)
   @display.print_answer(number_1-number_2)
 end
end

class Display
 def print_answer(answer)
   "The Answer is: #{answer}"
 end
end
