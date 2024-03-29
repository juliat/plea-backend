class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :user_id

  # Relationships
  # ========================================================================
  belongs_to :user
  has_many :classroom_assignments, :as => :assignable # polymorphic 
  has_many :classrooms, :through => :classroom_assignments

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
  	students = student_records.map{|student_record| Student.find(student_record.person_id)}
  end
end
