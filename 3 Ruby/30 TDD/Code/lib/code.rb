public

def my_unique
    unique_arr = []

    raise "Must call on array object" if !self.is_a?(Array)

    self.each do |ele|
        unique_arr << ele if !unique_arr.include?(ele)
    end
    unique_arr
end

def two_sum
    sum_arr = []
    self.each_with_index do |ele, indx|
        indx2 = indx+1

        while indx2 < self.length
            sum_arr << [indx, indx2] if self[indx] + self[indx2] == 0
            indx2 += 1
        end
    end
    sum_arr
end

def my_transpose
    trans_arr = Array.new(3) { Array.new(3) }

    self.each_with_index do |row, row_indx|
        row.each_with_index do |ele, col_indx|
            trans_arr[col_indx][row_indx] = ele
        end
    end
    trans_arr
end

def stock_picker
    min_price_day = self.index(self.min)
    days = [min_price_day, min_price_day+1]

    i = min_price_day + 1
    while i < self.length
        days[1] = i if self[i] > self[days.last]
        i += 1
    end
    days
end