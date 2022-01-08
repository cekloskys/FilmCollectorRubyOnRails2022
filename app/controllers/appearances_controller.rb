class AppearancesController < ApplicationController
	def index
		@actors = Actor.all
		@movies = Movie.all
		return @actors, @movies
	end

	def create
		appearance = Appearance.new(appearance_params)
		if appearance.save
			redirect_to "/actors"
		else
			flash[:errors] = appearance.errors.full_messages
			redirect_to "/appearances/new"
		end
	end

	private
	def appearance_params
		params.require(:appearance).permit(:actor_id, :movie_id)
	end
end
