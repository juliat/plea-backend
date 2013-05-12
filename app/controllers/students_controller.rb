class StudentsController < ApplicationController
	
	before_filter :authenticate_user!
	# load_and_authorize_resource

	def index
		if current_user.is_teacher?
			@students = current_user.teacher.current_students
		else
			@students = Student.all
		end
	end

	def behaviors
		@student = Student.find(params[:student_id])
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
