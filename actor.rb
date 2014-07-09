class Actor

  attr_reader :name, :age, :sex, :actions
  
  def initialize(name, age, sex)
    @name = name
    @age = age
    @sex = sex
    @actions = []
  end

  def most_suitable_role
    with_max_average = actions.select {|a| a[:average] == actions.map {|b| b[:average]}.max}
    with_max_average.map {|w| w[:role]}
  end

end