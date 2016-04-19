require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(username: 'ian', email: 'ian@ian.com', password: 'password')}

  describe "POST #create" do
    context "when valid user data is passed" do
      it "creates a new user" do
        post(:create, {user: { username: 'ben', email: 'ben@ben.com', password: '123'} })
        expect(assigns(:user)).to be_instance_of(User)
      end

      it "redirects to the user page if created" do
        post(:create, {user: { username: 'ben', email: 'ben@ben.com', password: '123'} })
        expect(response).to redirect_to("/users/#{assigns(:user).id}")
      end

      it "redirects back to new user page when invalid params are passed" do
        post(:create, {user: {username: ''}})
        expect(assigns(:user).id).to be_nil
      end

      it "re-renders the 'new' template" do
        post(:create, {user: {username: ''}})
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #new" do
    it "it renders the new page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "PUT #update" do
    let(:newuser) { User.create!(username: 'user', email: 'email', password: '12') }
    it "updates an existing user" do
      put :update, {id: newuser.id, user: {  username: 'iantests', email: 'em', password: '1'}}
      expect(assigns(:user).username).to eq('iantests')
    end
  end

end
