class Student < ApplicationRecord
    has_many :cards
    belongs_to :user
    has_one_attached :photo
    validates :name, :phone, :email, presence: true
end
