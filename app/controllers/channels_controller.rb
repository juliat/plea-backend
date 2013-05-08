class ChannelsController < ApplicationController
	def destroy
      @channel = Channel.find(params[:id])
      @channel.destroy
    end
end