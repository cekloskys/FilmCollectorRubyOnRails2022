class AppearancesController < ApplicationController
	# index method gets called when the appearances URL is requested.
	# index method is mapped to the appearances index.html.erb.
	def index
		# call all method on Actor model class.
		# all method selects all of the data in the actor table
		# and returns the data as an array of objects.
		# store the array of objects in instance variable.
		# instance variable is available to appearances index.html.erb.
		@actors = Actor.all
		# call all method on Movie model class.
		# all method selects all of the data in the movie table
		# and returns the data as an array of objects.
		# store the array of objects in instance variable.
		# instance variable is available to appearances index.html.erb.
		@movies = Movie.all
		return @actors, @movies
	end

	# create method gets called when the Create button is pushed
	# on the appearances index.html.erb.
	def create
		# call constructor of Appearance model class giving it the
		# actor id and movie id selected in the appearances
		# index.html.erb.
		# constructor creates Appearance model object which is stored in variable.
		appearance = Appearance.new(appearance_params)
		# call save method on Appearance object.
		# save method inserts the data in the Appearance model object into
		# the appearance table.
		if appearance.save
			# if the save method succeeds, request the actors URL which
			# will render the actors index.html.erb in the browser.
			redirect_to "/actors"
		else
			# if the save method fails, get the full messages associated with 
			# the errors.
			# store them in a Rails flash object named errors so that
			# the full messages may be displayed in the requested URL.
			flash[:errors] = appearance.errors.full_messages
			# request the appearances/index URL which
			# will render the appearances index.html.erb in the browser.
			redirect_to "/appearances/index"
		end
	end

	private
	def appearance_params
		# params is a Rails object that gets request parameters that are
		# marked as required and permitted. 
		params.require(:appearance).permit(:actor_id, :movie_id)
	end
end
