def sluggish(array)
    longest_fish = ''

    array.each do |fish|
        array.each do |fish2|
            longest_fish = fish if fish.length > fish2.length
        end
    end
    longest_fish
end

def dominant(array)
    return array if array.length <= 1

    mid_indx = array.length/2
    left_half = array[0...mid_indx]
    right_half = array[mid_indx..-1]

    merge(dominant(left_half), dominant(right_half))
end

def merge(left, right)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
        merged_array << left.shift
        when 0
        merged_array << left.shift
        when 1
        merged_array << right.shift
        end

        merged_array + left + right
    end    
end

def clever(array)
    longest_fish = ''

    array.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end
    longest_fish
end

#test
fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish(fish_array)
# p dominant(fish_array) NOT WORKING
p clever(fish_array)


