require_relative "room"

class Hotel
  
    def initialize(hotel_name, room_hash)
        @name = hotel_name
        @rooms = {}
        room_hash.each { |room , capacity| @rooms[room] = Room.new(capacity) }
    end

    def name
        caps = @name.split(" ").map { |word| word.capitalize }
        caps.join(" ")
    end

    def rooms
        @rooms
    end    

    def room_exists?(room)
        return true if @rooms.keys.include?(room)
        return false
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts "sorry, room does not exist"
        else
            if @rooms[room].add_occupant(person) == true
                puts "check in successful" 
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        return false if @rooms.values.all? { |room| room.full? }
        true
    end

    def list_rooms
        @rooms.each do |room_name, room_object| 
            puts "#{room_name}, #{room_object.available_space}"
        end
    end

end

