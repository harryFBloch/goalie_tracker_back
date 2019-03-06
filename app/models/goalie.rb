class Goalie < ApplicationRecord
  has_many :games
  has_many :blocks, through: :games
  has_many :goals, through: :games
  validates :first_name, :last_name,:team, presence: true

  def return_table_info_for_goalie
    # {name: , cons_saves: , left_crease:, pass: , waved_icing: , goal_count:, save_count}
    hash = gameInfoForGoalie()
    goalie_hash = {
      name: full_name(),
      cons_saves: hash[:cons_saves_count],
      pass: hash[:pass_count],
      left_crease: hash[:left_crease_count],
      waved_icing: hash[:waved_icing_count],
      blocks: self.blocks.count,
      goals: self.goals.count,
      games: self.games.count,
      avspg: hash[:avspg],
      id: self.id
    }
     h = goalie_hash.merge(self.blockStatsForGoalie())
     h.merge(self.goalStatsForGoalie())
  end

  def full_name
    "#{self.first_name.capitalize()} #{self.last_name.capitalize()}"
  end

  def gameInfoForGoalie
    hash = {cons_saves_count: 0, pass_count: 0, waved_icing_count: 0,
       left_crease_count: 0, avspg: 0.0
        }
    self.games.each do |game|
      hash[:cons_saves_count] += game.cons_saves
      hash[:pass_count] += game.pass
      hash[:waved_icing_count] += game.waved_icing
      hash[:left_crease_count] += game.left_crease
      hash[:avspg] = (hash[:avspg] + game.blocks.count.to_f) / 2
    end
    hash
  end

  def blockStatsForGoalie
    hash = {left_leg: 0, right_leg: 0, stick: 0,
      chest: 0, glove: 0, blocker: 0,
       p1: 0, p2: 0, p3: 0}
      self.blocks.each do |block|
        hash[block.pad.parameterize.underscore.to_sym] += 1
        hash[("p" + block.period.to_s).to_sym] += 1
      end
      hash
  end

  def goalStatsForGoalie
    hash = {h1: 0, h2: 0, h3: 0, h4: 0, h5: 0,
      gp1: 0, gp2: 0, gp3: 0}
      self.goals.each do |goal|
        hash[("h" + goal.hole).to_sym] += 1
        hash[("gp" + goal.period.to_s).to_sym] += 1
      end
    hash
  end

  def self.search(string)
    string.downcase if string != nil
    self.where(Goalie.arel_table[:last_name].lower.matches("%#{string}%"))
  end
end
