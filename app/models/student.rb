class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :last_name, :name

  # Relationships
  # ========================================================================
  has_many :classroom_assignments, :as => :assignable # polymorphic 
  has_many :charts
  has_many :student_behaviors
  has_many :behaviors, :through => :student_behaviors
  has_many :behavior_instances, :through => :behaviors

  # Scopes
  # ========================================================================
  scope :for_classroom, lambda{|classroom_number|}


  # Methods
  # ========================================================================
  def current_classroom
  	# look for assignments for this student
    ClassroomAssignment.current.for_role("Student").for_person(self.id).first
  end

  def charts
    Chart.for_student(self.id)
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

end
