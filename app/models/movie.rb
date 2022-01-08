class Movie < ApplicationRecord
	validates :title, :duration, :rating, :release_date, presence: true
end
