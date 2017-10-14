require_relative "Universe" 
require_relative "Star"
require_relative "Probe"
require_relative "Planet" 



def main()
  a=Universe.new(1024)#Create a universe
  a.printFunc#Prints 
  b=Probe.new(a)#Searches for intellegent life	
end
main