class StudentBehavior < ActiveRecord::Base
  attr_accessible :active, :behavior_id, :student_id

  # Relationships
  # ========================================================================
  belongs_to :student
  belongs_to :behavior
  has_many :behavior_instances
  
end
