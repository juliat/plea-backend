class ChartsController < ApplicationController
	def destroy
      @chart = Chart.find(params[:id])
      @chart.destroy
    end
end