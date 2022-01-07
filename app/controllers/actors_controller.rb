class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end

	def new
	end

	def create
		actor = Actor.new(actor_params)
		if actor.save
			redirect_to "/actors"
		else
			flash[:errors] = actor.errors.full_messages
			redirect_to "/actors/new"
		end
	end

	private
	def actor_params
		params.require(:actor).permit(:first_name, :last_name)
	end
end
