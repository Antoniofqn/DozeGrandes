class Match < ApplicationRecord
  include Filterable
  scope :filter_by_competition, -> (competition) { where competition: competition }
  scope :filter_by_stadium, -> (stadium) { where stadium: stadium }
  scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}
  belongs_to :home, class_name: 'Club'
  belongs_to :away, class_name: 'Club'
end
