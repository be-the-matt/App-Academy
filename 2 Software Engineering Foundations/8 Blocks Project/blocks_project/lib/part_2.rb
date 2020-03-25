def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    endings = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        endings.any? { |ending| url.include?(ending) }
    end
end

def any_passing_students?(students)
    # ave_grades = students.map do |student|
    #     student[:grades].sum / student[:grades].size
    # end
    # ave_grades.any? { |grade_ave| grade_ave >= 75 }

    students.any? do |student|
        ( student[:grades].sum / student[:grades].length * 1.0 ) >= 75
    end
end