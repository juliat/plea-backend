class StudentsController < ApplicationController
	
	# authenticate with devise
	before_filter :authenticate_user!

	def show
		@student = Student.all.sample
		# @chart_data = @student.current_chart
	end
	
	def destroy
      @student = Student.find(params[:id])
      @student.destroy
    end
end
