require 'rails_helper'

RSpec.describe 'User', type: :model do

	before(:each) do
		@user = User.new(email: 'abc@gmail.com', password: 'qwerty')
	end

	it "is valid with valid attributes" do
		expect(@user).to be_valid
	end

	it "is invalid without an email" do
		@user.email = nil
		expect(@user).to be_invalid
	end

	it "is invalid without a password" do
		@user.password = nil
		expect(@user).to be_invalid
	end
	
end