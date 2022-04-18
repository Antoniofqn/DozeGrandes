class Match < ApplicationRecord
  include Filterable
  scope :filter_by_competition, -> (competition) { where competition: competition }
  scope :filter_by_stadium, -> (stadium) { where stadium: stadium }
  scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%") }
  scope 'filter_by_start_date(1i)', -> (start_date) { where("DATE(date) > '#{Date.new(start_date.to_i)}'") }
  scope 'filter_by_end_date(1i)', -> (end_date) { where("DATE(date) < '#{Date.new(end_date.to_i)}'") }
  belongs_to :home, class_name: 'Club'
  belongs_to :away, class_name: 'Club'
end
