class Planet
	attr_accessor :intellegent,:distance,:id	
	def initialize(type,intellegent,distance,id)
	@intellegent=intellegent
	@type=type
	@distance=distance
	@id=id
	end

end
class RockyPlanet < Planet#Rocky planet subclass
	def initialize(intellegent,distance,id)
		super("RockyPlanet",intellegent,distance,id)
	end
end
class GaseousPlanet < Planet#Gaseous Planet Subclass
	def initialize(intellegent,distance,id)
		super("GaseousPlanet",intellegent,distance,id)
	end
end
class HabitablePlanet < Planet#Habitable Planet subclass
	def initialize(intellegent,distance,id)
		super("HabitablePlanet",intellegent,distance,id)
	end
end

