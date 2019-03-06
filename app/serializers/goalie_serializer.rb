class GoalieSerializer < ActiveModel::Serializer
  attributes :id, :team, :first_name, :last_name
  has_many :blocks
  has_many :goals
  has_many :games
end
