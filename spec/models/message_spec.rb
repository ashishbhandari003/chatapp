require 'rails_helper'

RSpec.describe 'Message', type: :model do

	before(:each) do
		user = User.new(email: 'abc@gmail.com', password: 'qwerty')
		@message = Message.new(content: 'some desciption', user: user)
	end

	it "is valid with valid attributes" do
		expect(@message).to be_valid
	end

	it "is invalid without an content" do
		@message.content = nil
		expect(@message).to be_invalid
	end

	it "is invalid without a user" do
		@message.user = nil
		expect(@message).to be_invalid
	end
	
end