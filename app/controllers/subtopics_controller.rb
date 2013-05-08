class SubtopicsController < ApplicationController
	def destroy
      @subtopic = Subtopic.find(params[:id])
      @subtopic.destroy
    end
end