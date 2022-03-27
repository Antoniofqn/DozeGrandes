class Match < ApplicationRecord
  belongs_to :home, class_name: 'Club'
  belongs_to :away, class_name: 'Club'
end
