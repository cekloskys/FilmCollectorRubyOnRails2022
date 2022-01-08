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

	def show
		@movies = Actor.find(params[:id]).movies
	end

	def edit
		@actor = Actor.find(params[:id])
	end

	def update
		actor = Actor.find(params[:id])
		if actor.update(actor_params)
			redirect_to "/actors"
		else
			flash[:errors] = actor.errors.full_messages
			redirect_to "/actors/#{actor.id}/edit"
		end
	end

	def delete
		@actor = Actor.find(params[:id])
	end

	def destroy
		actor = Actor.find(params[:id])
		actor.destroy
		redirect_to "/actors"
	end

	private
	def actor_params
		params.require(:actor).permit(:first_name, :last_name)
	end
end
