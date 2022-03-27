class Club < ApplicationRecord
  has_many :home_matches, class_name: 'Match',
                            foreign_key: 'home_id'
  has_many :away_matches, class_name: 'Match',
                            foreign_key: 'away_id'
end
