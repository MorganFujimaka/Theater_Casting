class Actor

  attr_reader :name, :age, :sex, :actions
  
  def initialize(name, age, sex)
    @name = name
    @age = age
    @sex = sex
    @actions = []
  end

  def most_suitable_role
    with_max_average = actions.select { |a| a[:average] == actions.map { |b| b[:average] }.max }
    most_suitable_roles = with_max_average.map { |w| w[:role] }
    "You hold casting on different roles (#{actions.map {|a| a[:role]}.join(", ")}), but the most suitable for you is #{most_suitable_roles.join}."
  end

  def average_action_time
  	average_time = actions.map { |a| a[:time] }.inject { |sum, i| sum + i } / actions.size
  	"Your average time on a stage is #{average_time} minutes."
  end

end