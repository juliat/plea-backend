class ClassroomAssignment < ActiveRecord::Base
  attr_accessible :classroom_id, :end_date, :person_id, :person_type, :start_date

  # Relationships
  # ========================================================================
  belongs_to :classroom
  # make relationship with people (students and teachers) polymorphic
  belongs_to :assignable, :polymorphic => true 

  # Scopes
  # ========================================================================
  scope :for_role, lambda{|role_name| where("person_type = ?", role_name)}
  scope :current, where("end_date = ?", nil)
  scope :for_id, lambda{|id| where("person_id = ?", id)}
  
end