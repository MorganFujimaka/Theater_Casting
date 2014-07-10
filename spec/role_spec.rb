require 'spec_helper'

describe Role do
  
  describe "#initialize" do
    it "sets name, sex and age for the role" do
    role = Role.new("Hulk", "male", 30..40)
    expect(role.name).to eq("Hulk")
    expect(role.sex).to eq("male")
    expect(role.age).to eq(30..40)
    end
  end
	
end
