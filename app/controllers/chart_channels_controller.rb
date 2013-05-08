class ChartChannelsController < ApplicationController
	def destroy
      @chart_channel = ChartChannel.find(params[:id])
      @chart_channel.destroy
    end
end