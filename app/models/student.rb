class Student < ApplicationRecord
    has_many :cards
    validates :name, :phone, :email, presence: true
end
