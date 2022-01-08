class Actor < ApplicationRecord
	has_many :appearances, dependent: :destroy
	has_many :movies, through: :appearances
	validates :first_name, :last_name, presence: true
end
