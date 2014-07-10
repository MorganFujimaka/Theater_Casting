require 'spec_helper'

describe Casting do

  before do
    @casting = Casting.new(Role.new("Hulk", "male", 30..40))
  end
  
  subject { @casting }
  
  it {should respond_to(:perform)}
  it {should_not respond_to(:rate_actor)}
  it {should_not respond_to(:average_score)}
	
end
