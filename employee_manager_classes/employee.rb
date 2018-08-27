class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name)
    @name = name
    @title = 'mere peon'
    @salary = 24000
    @boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
    
  end
end

class Manager < Employee
  attr_accessor :all_employees
end
