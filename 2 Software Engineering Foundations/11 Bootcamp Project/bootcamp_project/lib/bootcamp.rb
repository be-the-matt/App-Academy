class Bootcamp
    
    def initialize(name, slogan, student_capacity)
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
        
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        ( @students.length / @teachers.length ).floor
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        end
        return false
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if enrolled?(student) && num_grades(student) > 0
            return ( @grades[student].sum / num_grades(student) ).floor
        end
        nil
    end

end

