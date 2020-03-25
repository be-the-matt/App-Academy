class Room
    
    def initialize(num_rooms)
        @capacity = num_rooms
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        return false if @occupants.length < @capacity
        true
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(occupant_name)
        if self.full? == false
            @occupants << occupant_name
            return true
        end
        return false
    end

end
