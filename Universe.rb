require_relative "Star"
class Universe 
	attr_accessor :stars,:num_giant,:num_dwarf,:num_medium,:max_stars
	def initialize(max_stars)
		
		@max_stars=max_stars
		@num_giant=0
		@num_dwarf=0
		@num_medium=0

		i=0
		@stars = []#store stars in an array
		#Generatig stars
		while i<@max_stars
			type = rand(3)
			#3 random number for star location
			coordinates =[rand(2**8..2**64),rand(2**8..2**64),rand(2**8..2**64)]
			
			if type == 0
				#Generates Giant Star
				s = GiantStar.new(coordinates)
				@num_giant+=1;
			elsif type == 1
				#Generates Dwarf Star
				s = DwarfStar.new(coordinates)
				@num_dwarf+=1
			else
				#Generates Medium Star
				s = MediumStar.new(coordinates)
				@num_medium+=1
			end
			@stars.push(s)#pushes stars to stars arrays
			i=i+1
		end

	end
	def printFunc#Prints whole universe

        giant_stars = 0
        giant_gaseous_planets = 0
        giant_rocky_planets = 0
		giant_habitable_planets = 0
		giant_intellegent_life = 0
        dwarf_stars = 0
        dwarf_gaseous_planets = 0
        dwarf_rocky_planets = 0
		dwarf_habitable_planets = 0
		dwarf_intellegent_life = 0
        medium_stars = 0
        medium_gaseous_planets = 0
        medium_rocky_planets = 0
		medium_habitable_planets = 0
		medium_intellegent_life = 0

        for i in 0..@max_stars-1#A loop for accessing all stars

            if @stars[i].is_a? DwarfStar
				giant_rocky_planets += @stars[i].num_rock
				giant_gaseous_planets += @stars[i].num_gase
				giant_habitable_planets += @stars[i].num_habit
				giant_intellegent_life += @stars[i].num_intellegence
            elsif @stars[i].is_a? GiantStar
				dwarf_rocky_planets += @stars[i].num_rock
				dwarf_gaseous_planets += @stars[i].num_gase
				dwarf_habitable_planets += @stars[i].num_habit
				dwarf_intellegent_life += @stars[i].num_intellegence
            else
				medium_rocky_planets += @stars[i].num_rock
				medium_gaseous_planets += @stars[i].num_gase
				medium_habitable_planets += @stars[i].num_habit
				medium_intellegent_life += @stars[i].num_intellegence
			end
        end
        #Printing part
        puts "Total number of stars in my universe: #{max_stars}"
		puts "There are #{num_giant} Giant Stars with:"
		puts "\t#{giant_gaseous_planets} Gaseous Planets"
		puts "\t#{giant_rocky_planets} Rocky Planets"
		puts "\t#{giant_habitable_planets} Habitable Planets"
		puts "\t#{giant_intellegent_life} Planets with Intelligent Life"
        puts "There are #{num_dwarf} Dwarf Stars with:"
		puts "\t#{dwarf_gaseous_planets} Gaseous Planets"
		puts "\t#{dwarf_rocky_planets} Rocky Planets"
		puts "\t#{dwarf_habitable_planets} Habitable Planets"
		puts "\t#{dwarf_intellegent_life} Planets with Intelligent Life"
        puts "There are #{num_medium} Medium Stars with:"
		puts "\t#{medium_gaseous_planets} Gaseous Planets"
		puts "\t#{medium_rocky_planets} Rocky Planets"
		puts "\t#{medium_habitable_planets} Habitable Planets"
		puts "\t#{medium_intellegent_life} Planets with Intelligent Life"
		
	end
end
