class Employee

    attr_reader :salary
    attr_accessor :employees

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary, boss
        @boss.fill_employees(self) if @boss != nil
    end

    def bonus(multiplier)
        @bonus = @salary * multiplier
    end

    def fill_employees(employee)
        self.employees << employee
    end
end


class Manager < Employee

    
    def initialize(name, title, salary, boss = nil)
        @employees = []
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
        bonus = 0
        employee_queue = @employees.dup

        until employee_queue.empty?
            employee = employee_queue.pop
            bonus += employee.salary

            if employee.employees != nil
                employee.employees.each do |employee|
                    employee_queue << employee
                end
            end
        end
        bonus * multiplier
    end

end

#test
ned = Manager.new('ned', 'founder', 1000000)
darren = Manager.new('darren', 'ta manager', 78000, ned)
shawna = Employee.new('shawna', 'TA', 12000, darren)
david = Employee.new('david', 'TA', 10000, darren)

p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
p ned.bonus(5) # => 500_000