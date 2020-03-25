require "employee"

class Startup

    attr_reader( :name, :funding, :salaries, :employees)

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end
    
    def >(startup2)
        @funding > startup2.funding
    end

    def hire(name, title)
       if self.valid_title?(title)
        @employees << Employee.new(name, title)
       else
        raise "no title exists" 
       end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "too poor!"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        employee_salaries = @employees.map do |employee|
            salaries[employee.title]
        end
        employee_salaries.sum / @employees.length if @employees.length > 0
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(acquired_startup)
        @funding += acquired_startup.funding

        acquired_startup.salaries.each do |title, pay|
            if !@salaries.has_key?(title)
                @salaries[title] = pay
            end
        end
        @employees += acquired_startup.employees
        acquired_startup.close
    end

end


#testing

# salaries = {
#       "CEO"=>5000,
#       "CTO"=>4200,
#       "Software Engineer"=>3000,
#       "Junior Developer"=>2400
#     }
# startup_1 = Startup.new("Mystry Machinr", 22000, salaries)

# startup_1.hire("Scooby", "CEO")
#         startup_1.hire("Velma", "CTO")
#         startup_1.hire("Daphne", "Software Engineer")
#         startup_1.hire("Fred", "Software Engineer")

# p startup_1.average_salary
# p employee = Employee.new("Scooby", "CEO")
# p startup_1.pay_employee(employee)
# p startup_1.name
# p startup_1.funding
# p startup_1.salaries
# p startup_1.employees

# p employee.earnings