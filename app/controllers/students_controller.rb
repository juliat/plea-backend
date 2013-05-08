class StudentsController < ApplicationController
	def index
		@student = Student.all.sample
		# @chart_data = @student.current_chart
	end
	
	def destroy
      @student = Student.find(params[:id])
      @student.destroy
    end
end
