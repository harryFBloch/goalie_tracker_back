class Goal < ApplicationRecord
  belongs_to :goalie
  belongs_to :game
  validates :hole, :period, presence: true
end
