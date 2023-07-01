class Tweet < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_description, against: :description
  validates :description, presence: true
  validates :userName, presence: true
end
