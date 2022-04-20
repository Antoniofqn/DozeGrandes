class Club < ApplicationRecord
  has_many :home_matches, class_name: 'Match',
                            foreign_key: 'home_id'
  has_many :away_matches, class_name: 'Match',
                            foreign_key: 'away_id'
  has_one_attached :photo

  def total_goals(matches)
    total_goals = 0
    matches.where(home: self).each do |match|
      total_goals += match.score_home
    end
    matches.where(away: self).each do |match|
      total_goals += match.score_away
    end
    total_goals
  end
end
