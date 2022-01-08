class Appearance < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  validates :actor_id, :movie_id, presence: true
end
