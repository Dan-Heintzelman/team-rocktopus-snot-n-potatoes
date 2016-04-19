require 'rails_helper'
require 'shoulda-matchers'

describe User do
	let(:user) {user = User.create(username: 'ben', email: 'ben@ben.com', password: 'password')}

	describe "validations" do
		it "validates username" do
			should_not allow_value("").for(:username)
		end

		it "validates email" do
			should validate_presence_of(:email)
		end

		it "validates password_digest" do
			should validate_presence_of :password_digest
		end

		it "exists in database when created" do
			user = User.create(username: 'ben', email: 'ben@ben.com', password: 'password')
			expect(User.count).to eq(1)
		end

		it "validates uniqueness of email" do
			user = User.create(username: 'ben', email: 'ben@ben.com', password: 'password')
			user = User.create(username: 'ben', email: 'ben@ben.com', password: 'password')
			expect(User.count).to eq(1)
		end
	end
end
