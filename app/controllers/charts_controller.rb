class ChartsController < ApplicationController
	def show
		@chart = Chart.find(params[:id])
		# render :layout => "chart_layout"
		
		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @chart.day_metrics }
      	end
	end

	def destroy
      @chart = Chart.find(params[:id])
      @chart.destroy
    end
end