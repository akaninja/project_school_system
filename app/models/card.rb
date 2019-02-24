class Card < ApplicationRecord
  belongs_to :student
  validates :price, :classes, presence: true
end
