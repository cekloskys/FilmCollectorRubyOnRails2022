class Movie < ApplicationRecord
	has_many :appearances, dependent: :destroy
	has_many :actors, through: :appearances
	validates :title, :duration, :rating, :release_date, presence: true
end
