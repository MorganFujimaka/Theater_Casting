require 'spec_helper'

describe Actor do

  before do
    @actor = Actor.new("Morgan", 26, "male")
  end
  
  subject { @actor }
  
  it {should respond_to(:most_suitable_role)}
  it {should respond_to(:average_action_time)}
  it {should respond_to(:actions)}
	
end
