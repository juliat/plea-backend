class TeachersController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		if current_user.is_teacher?
			@teachers = [] << current_user.teacher
		else
			@teachers = Teacher.all
		end
	end
end
