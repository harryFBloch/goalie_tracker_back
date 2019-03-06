class Game < ApplicationRecord
  belongs_to :goalie
  has_many :blocks
  has_many :goals
  validates :date, presence: true
end
