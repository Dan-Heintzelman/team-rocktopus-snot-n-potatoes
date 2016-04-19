require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(username: 'ian', email: 'ian@ian.com', password: 'password')}

  describe "POST #create" do
    context "when valid user data is passed" do
      it "creates a new user" do
        post(:create, {user:(username: 'ben', email: 'ben@ben.com', password: '123')})
        expect(assigns(:user)).to be_instance_of(User)
      end
    end

  end
end
