class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def new
	end

	def create
		movie = Movie.new(movie_params)
		if movie.save
			redirect_to "/movies"
		else
			flash[:errors] = movie.errors.full_messages
			redirect_to "/movies/new"
		end
	end

	private
	def movie_params
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end
end
