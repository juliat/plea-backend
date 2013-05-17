class StudentsController < ApplicationController
	
	before_filter :authenticate_user!
	# load_and_authorize_resource

	def index
		if current_user.is_teacher?
			@students = current_user.teacher.current_students
		else
			@students = Student.all
		end

		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @students.map{ |student| {:id => student.id, :name => student.first_name + ' ' + student.last_name } }}
      	end
	end

	def behaviors
		@student = Student.find(params[:student_id])

		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @student }
      	end
	end

	def show
		@student = Student.find(params[:student_id])
		
		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @student, :only => [:id, :name]  }
      	end
	end
	
	def create
	  @student = Article.new(params[:article])
	  flash[:notice] = @student.save ? "Student was created." : "Student failed to save."
	  respond_with @student do |format|
	    format.html { @student.valid? ? redirect_to(@student) : render(:new) }
	    format.json { render :json => @student }
	  end
	end

	def destroy
      @student = Student.find(params[:id])
      @student.destroy
    end
end
