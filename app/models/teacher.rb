class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :user_id

  # Relationships
  # ========================================================================
  belongs_to :user
  has_many :classroom_assignments, :as => :assignable # polymorphic 

  # Scopes
  # ========================================================================
  scope :for_user, lambda{|user_id| where("user_id = ?", user_id)}

  # Methods
  # ========================================================================
  def classrooms
  	ClassroomAssignment.for_role("Teacher").for_person(self.id)
  end

  def current_classroom
  	ClassroomAssignment.for_role("Teacher").current.for_person(self.id).first
  end

  def current_students
  	student_records = ClassroomAssignment.for_role("Student").current.for_classroom(self.current_classroom.classroom_id).all
  	student_ids = student_records.map{|student_record| student_record.person_id}
  	students = student_ids.map{|student_id| Student.find(student_id)}
  	return current_students
  end

end
