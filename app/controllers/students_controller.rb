class StudentsController < ApplicationController
	def index
		if current_user.is_teacher?
			@students = current_user.teacher.current_students
		else
			@students = Student.all
		end
	end
	
	def show
		@student = Student.all.sample
		# @chart_data = @student.current_chart
	end
	
	def destroy
      @student = Student.find(params[:id])
      @student.destroy
    end
end
