require 'test_helper'

class StudentTest < ActiveSupport::TestCase

	# shoulda tests can go here

	# FactoryGirl Tests
	# ========================================================
	# setup a context for the test
	setup do
		@mark = FactoryGirl.create(:student)
		@classroom = FactoryGirl.create(:classroom)
		@student_classroom_assignment = FactoryGirl.create(:classroom_assignment, :classroom => @classroom, :assignable => @mark)
	end
	# provide a teardown method
	teardown do
		@mark.destroy
		@classroom.destroy
		@student_classroom_assignment.destroy
	end

	# tests
	#should "show that the current_classroom method returns the number of the student's current classroom" do
		# assert_equal 4, @mark.current_classroom
	#end
end
