class ChartsController < ApplicationController
	def show
		@chart = Chart.find(params[:id])
		# render :layout => "chart_layout"
		
		respond_to do |format|
      		format.html # show.html.erb
			format.json { render :json => @chart.instance_eval{ |chart| {:id => chart.id, 
															   :name => chart.chart_name,
															   :student => chart.student.name,
															   :topic => chart.topic.name,
															   :subtopic => chart.subtopic.name,
															   :day_metrics => chart.day_metrics.map{|day_metric| {:id => day_metric.id,
															   													   :date => day_metric.day_record.date,
															   													   :metric => Metric.find(day_metric.metric_id).instance_eval{|metric| {:metric_id => metric.id, :name => metric.name, :symbol => metric.symbol}},
															   													   :metric_value => day_metric.metric_value
															   													  }
															   										}
													 		}
													 }
						}
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
			format.json {render :json => @chart}
			format.xml  { render :xml => @chart }
		end    	
	end
end