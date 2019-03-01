class Student < ApplicationRecord
    has_many :cards
    has_many :list_students
    belongs_to :user
    has_one_attached :photo
    validates :name, :phone, :email, presence: true
end
