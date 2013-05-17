class BehaviorsController < ApplicationController
	def show
		@behavior = Behavior.find(params[:id])

		respond_to do |format|
      		format.json { render json: @behavior, :only => [:id, :code, :name] }
      	end
    end
end
