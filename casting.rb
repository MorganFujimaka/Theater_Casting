require_relative 'role'
require_relative 'actor'
require_relative 'action'

class Casting

  COMMISION = { "Jack Nicholson" => :male, "Mel Gibson" => :male, "Audrey Hepburn" => :female, 
                "Kate Beckinsale" => :female, "Hugh Jackman" => :male }

  attr_reader :role

  def initialize(role)
    @role = role
  end

  def is_suitable?(actor)
    role.sex == actor.sex && role.age.include?(actor.age)
  end

  def perform(actor, action)
    raise "You are not suitable for the #{role.name} role, get out!" unless is_suitable?(actor)
    raise "Not so quickly, baby, you can't act twice for this role!" if actor.actions.any? {|a| a[:role] == role.name}
    actor.actions << { role: role.name, topic: action.topic, time: action.time, text: action.text,
                       average: average_score(actor, action) }
  end

  private

  def rate_actor(actor, action)
    COMMISION.map do |k, v|
      if (v == :male) && (actor.sex == "female") && (18..25).include?(actor.age)
        rand(7..10)
      elsif (v == :female) && (action.text.gsub(/[[:punct:]]/,"").split.size < 30)
      	rand(1..7)
      else
        rand(1..10)
      end
    end
  end

  def average_score(actor, action)
    rate_actor(actor, action).inject { |sum, m| sum + m }.to_f / rate_actor(actor, action).size
  end  

end
