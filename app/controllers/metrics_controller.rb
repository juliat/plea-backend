class MetricsController < ApplicationController
	def chart
		@student = Student.all.sample
		@chart_data = @student.current_chart
	end
end
