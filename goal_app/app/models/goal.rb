class Goal < ApplicationRecord
  validates :title, :user_id, presence: true
  validates_inclusion_of :public, :completed, in: [true, false]
  
  belongs_to :user
end
