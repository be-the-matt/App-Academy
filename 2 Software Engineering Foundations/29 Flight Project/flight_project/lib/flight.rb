class Flight
    attr_accessor :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        return true if @passengers.length == @capacity
        false
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger 
        end
    end

    def list_passengers
        @passengers.map(&:name)
    end

    def [](n)
        @passengers[n]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end