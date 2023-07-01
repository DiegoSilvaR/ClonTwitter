class Tweet < ApplicationRecord
  include PgSearch::Model
    pg_search_scope :search_full_text,
   against: {
    description: 'A',
    userName: 'B',
    }

  validates :description, presence: true
  validates :userName, presence: true
end
