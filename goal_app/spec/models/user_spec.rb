require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.create(:user) }
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) } 
  
  it "doesn't save the password to the databse" do
    expect(User.find(user.id).password).to be_nil
  end
  
  it "ensures a :session_token" do
    expect(user.session_token).not_to be_nil
  end
  
  describe "#reset_session_token!"
    it "resets the session token" do
      old_token = user.session_token
      new_token = user.reset_session_token!
      expect(new_token).not_to eq(old_token)
    end

  describe "::find_by_credentials" do
    it "finds a user when given valid credentials" do
      found_user = User.find_by_credentials(user.username, "password")
      expect(found_user).to eq(user)
    end
    
    it "returns nil when given invalid credentials" do
      expect(User.find_by_credentials(user.username, "wordpass")).to be_nil
    end
  end 
end
  
