require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal) { FactoryBot.create(:goal) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_inclusion_of(:public).in_array([true, false]) }
  it { should validate_inclusion_of(:completed).in_array([true, false]) }
  it { should belong_to(:user) }
  
end
