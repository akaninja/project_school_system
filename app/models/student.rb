class Student < ApplicationRecord
    has_many :cards
    has_one_attached :photo
    validates :name, :phone, :email, presence: true
end
