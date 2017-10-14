require_relative "Universe"
require_relative "Star"

class Probe
	attr_accessor :fuel,:path_array,:fuel,:planet_discovered
	

	def initialize(universe)
		@planet_discovered=[]#To store explored planet ids
		@DIVIDEOP=85#My search algorithm spends fuel more than usual so I divide the distance 
		coord=[] # To store coordinates
		#Cloned universe to not lose the original universe while making some operations
		@universe=Marshal.load(Marshal.dump(universe)) 
		coordinates =[rand(2**8..2**64),rand(2**8..2**64),rand(2**8..2**64)]#starting point
		@fuel=2**64
		total=0#Total distance travelled
		temp=0
		life=false
		star_index=0
		visited=0
		while @universe.stars.length>0 and @fuel>0 and life == false
			min = 2**1000
			for i in @universe.stars#Finds the closest star to the current coordinates 
				
				temp=(Math.sqrt((coordinates[0]-i.coor[0])**2+(coordinates[1]-i.coor[1])**2+(coordinates[2]-i.coor[2])**2))/(@DIVIDEOP)
				
				if(temp<min)	
					min=temp
					star_index=i	
				end
			
			end
			#At the end of for loop above star_index will be the closest star
			total=min+total
			#Subtract the fuel spent and add the recharge value of star 
			@fuel=(fuel-min)+star_index.recharge			
			visited+=1
			for j in star_index.planet_array
				#Distance to get a planet in the star subtracted from fuel
				@fuel=fuel-(j.distance*10000000)
				total=total+j.distance*10000000
				planet_discovered.push(j)#Stored discovered planets
				if j.is_a? HabitablePlanet
					
					#If a planet is Habitable and has intellegent life then the search stops
					if(j.intellegent==true)
						life=true	
						id=j.id#Planet's id
						#Called print function
						printFunc(total,@fuel,visited,planet_discovered.length,id,coord[0])
						#Total amount of fuel needed to get home
						home=((Math.sqrt((coord[0][0]-star_index.coor[0])**2+(coord[0][1]-star_index.coor[1])**2+(coord[0][2]-star_index.coor[2])**2)))/(@DIVIDEOP)
						puts "To get home #{home} needed"
						if home>@fuel
							puts" Life found but don't have enough fuel to return"
						end 
						
					else
						@fuel=fuel-(j.distance*10000000)#returning to the current star back	
						total=total+j.distance*10000000
					end
				end
			end
			if(fuel<0)

				puts 'out of fuel'
			end
			coord.push(coordinates)#pushed coordinates to an array
			#Moving to the next coordinate
			coordinates[0]=star_index.coor[0]
			coordinates[1]=star_index.coor[1]
			coordinates[2]=star_index.coor[2]
			
			@universe.stars.delete(star_index)#Deleting the visited star from the cloned universe

		end
		end
		def printFunc(total,fuel,visited,planet_discovered,planet,x)#Print function
			puts "=========="
			puts "Your origin was ( #{x[0]} , #{x[1]} , #{x[2]} )"
			puts "\t Traveled #{total} miles"
			puts "\t You have #{fuel} remaining"
			puts "\t Visited #{visited} stars"
			puts "\t Explored #{planet_discovered} planet"
			puts "Found life on #{planet}"
		end
end	