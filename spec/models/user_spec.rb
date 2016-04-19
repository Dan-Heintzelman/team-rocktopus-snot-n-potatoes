require 'rails_helper'

describe User do
	let(:user) {User.new}

	describe "validations" do
		it "validates username" do
			should_not allow_value("").for(:username)
		end

		it "validates email" do
			should validate_presence_of :email
		end

		it "validates password_digest" do
			should validate_presence_of :password_digest
		end

	end
end