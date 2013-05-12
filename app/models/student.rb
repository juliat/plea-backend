class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :last_name

  # Relationships
  # ========================================================================
  has_many :classroom_assignments, :as => :assignable # polymorphic 
  has_many :charts

  # Scopes
  # ========================================================================
  scope :for_classroom, lambda{|classroom_number|}


  # Methods
  # ========================================================================
  def current_classroom
  	# look for assignments for this student
    ClassroomAssignment.current.for_role("student").for_id(self.id)
  end

end
