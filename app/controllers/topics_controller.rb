class TopicsController < ApplicationController
	def destroy
      @topic = Topic.find(params[:id])
      @topic.destroy
    end
end