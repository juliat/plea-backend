class ChartsController < ApplicationController
	def show
		render :layout => "chart_layout"
	end

	def destroy
      @chart = Chart.find(params[:id])
      @chart.destroy
    end
end