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

    def create
		@chart = Chart.new(params[:chart])
		flash[:notice] = @chart.save ? "Chart was created." : "Chart failed to save."
		respond_with @chart do |format|
			format.html { @chart.valid? ? redirect_to(@chart) : render(:new) }
			format.json { render :json => @chart }
			format.xml  { render :xml => @chart }
		end    	
	end
end