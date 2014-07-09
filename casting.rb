require_relative 'roles'
require_relative 'actor'
require_relative 'action'

class Casting

  COMMISION = { "Jack Nicholson" => :male, "Mel Gibson" => :male, "Audrey Hepburn" => :female, 
  	            "Kate Beckinsale" => :female, "Hugh Jackman" => :male }

  attr_reader :role, :ratings

  def initialize(role)
  	@role = role
  	@ratings = []
  end

  def is_suitable?(actor)
  	role.sex == actor.sex && role.age.include?(actor.age)
  end

  def action(actor, action)
  	raise "You are not suitable for the #{role.name} role, get out!" unless is_suitable?(actor)
  	raise "Not so quickly, baby, you can't act twice!" if actor.actions.any? {|a| a[:role] == role.name}
  	actor.actions << { role: role.name, topic: action.topic, time: action.time, text: action.text, average: average_mark(actor, action) }
  end

  def rate_actor(actor, action)
    COMMISION.map do |k, v|
      if (v == :male) && (actor.sex == "female") && (18..25).include?(actor.age)
        rand(7..10)
      elsif (v == :female) && (action.text.split.size < 30)
      	rand(1..7)
      else
        rand(1..10)
      end
    end
  end

  def average_mark(actor, action)
  	rate_actor(actor, action).inject { |sum, m| sum + m }.to_f / rate_actor(actor, action).size
  end  

end

role1 = Role.new("Iron Man", "male", 15..40)
role2 = Role.new("Captain America", "male", 15..30)

actor1 = Actor.new("Morgan", 26, "male")

casting1 = Casting.new(role1)
action1 = Action.new("Fly", 30, "I beleive I can fly")

casting2 = Casting.new(role2)
action2 = Action.new("Swim", 25, "I beleive I can swim")

casting1.action(actor1, action1)
casting2.action(actor1, action2)

puts actor1.actions
puts actor1.most_suitable_role