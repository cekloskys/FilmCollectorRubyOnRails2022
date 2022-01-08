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

	def show
		@actors = Movie.find(params[:id]).actors
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		movie = Movie.find(params[:id])
		if movie.update(movie_params)
			redirect_to "/movies"
		else
			flash[:errors] = movie.errors.full_messages
			redirect_to "/movies/#{movie.id}/edit"
		end
	end

	def delete
		@movie = Movie.find(params[:id])
	end

	def destroy
		movie = Movie.find(params[:id])
		movie.destroy
		redirect_to "/movies"
	end

	private
	def movie_params
		params.require(:movie).permit(:title, :duration, :rating, :release_date)
	end
end
