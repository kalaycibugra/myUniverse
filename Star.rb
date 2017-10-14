require_relative "Planet"
require 'securerandom'
class Star
	attr_accessor :planet_array,:coor,:num_planet,:num_intellegence,:num_rock,:num_gase,:num_habit,:distance,:Chances_Of_Life,:range_Of_Planets,:goldilocks_Zone,:recharge,:id,:visited	
  def initialize(chance,range,goldilock,recharge)
    @chances_Of_Life=chance
    @range_Of_Planets=range
    @goldilocks_Zone=goldilock
    @recharge=recharge
  	@planet_array=[]
  	
  	
  	@num_planet=rand(range_Of_Planets[0]..range_Of_Planets[1])
  	#Line 15 to 18 is for keeping track of quantitiy planet type
  	@num_intellegence=0
  	@num_rock=0
  	@num_gase=0
  	@num_habit=0
  	i=0
  	while i<num_planet
  			#Generate 3 random numbers to generate planets
			type = rand(3)
			#Generate planet distance 
			@distance=rand(300)
			#Generate 3 random numbers for coordinates
			coordinates =[rand(2**8..2**64),rand(2**8..2**64),rand(2**8..2**64)]

			#Create planets and keep track of their quantities
			if type == 0
				s = RockyPlanet.new(false,distance,"r_"+SecureRandom.urlsafe_base64)
				@num_rock += 1				
			elsif type == 1
				
				s = GaseousPlanet.new(false,distance,"g_"+SecureRandom.urlsafe_base64)
				@num_gase+=1
			else
				
				@num_habit+=1
				#The condition for habitable planet
				if(rand(10000)<=@chances_Of_Life and (distance>=@goldilocks_Zone[0]and distance<=@goldilocks_Zone[1]))
					@num_intellegence+=1
					#Planet that has intellegent life
					s = HabitablePlanet.new(true,distance,"h_"+SecureRandom.urlsafe_base64)
				else
					#Habitable but not has intellegent life
					s = HabitablePlanet.new(false,distance,"h_"+SecureRandom.urlsafe_base64)	
				end	
				@num_habit+=1
			end
			#Pushed all planets to an array
			@planet_array.push(s)
			i=i+1
		end
  end
end
#Subclasses
class DwarfStar < Star
	def initialize(coordinates)
	@coor=coordinates
	super(6,[8,15],[30,90],2**20)
	end
end
class GiantStar < Star
	def initialize(coordinates)
	@coor=coordinates
	super(5,[5,10],[100,250],2**30)
	end
end
class MediumStar < Star
	def initialize(coordinates)
	@coor=coordinates
	super(9,[2,9],[60,140],2**25)
	end
end
