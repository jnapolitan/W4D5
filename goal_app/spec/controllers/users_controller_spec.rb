require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new users template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    context "with valid params" do
      it "logs in the user" do
        post :create, params: { user: { username: "mavers", password: "doggies" } }
        user = User.find_by(username: "mavers")
        expect(session[:session_token]).to eq(user.session_token)
      end    
    end
    
    context "with invalid params" do
      it "renders errors and redirects to login page" do
        post :create, params: { user: { username: "mavers", password: "" } }
        expect(flash[:errors]).to be_present
        expect(response).to render_template(:new)
      end
    end
  end
end