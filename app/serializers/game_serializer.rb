class GameSerializer < ActiveModel::Serializer
  attributes :id, :opposing_team, :oppsoing_game_id, :goalie_id,
   :home_bool, :period, :cons_saves, :pass, :left_crease, :waved_icing, :date
  belongs_to :goalie
  has_many :goals
  has_many :blocks
end
