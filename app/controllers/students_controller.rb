class StudentsController < ApplicationController
	def index
		@student = Student.all.sample
		# @chart_data = @student.current_chart
	end
end
