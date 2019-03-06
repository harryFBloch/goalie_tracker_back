class Block < ApplicationRecord
  belongs_to :goalie
  belongs_to :game
  validates :pad, :period, presence: true
end
