class ChartsController < ApplicationController
	def show
		@chart = Chart.find(params[:id])
		render :layout => "chart_layout"
	end

	def destroy
      @chart = Chart.find(params[:id])
      @chart.destroy
    end
end