class List < ApplicationRecord
  belongs_to :user
  has_many :list_students
  has_many :students, through: :list_students
  validates :title, presence: true
end
