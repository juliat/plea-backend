class ClassroomAssignment < ActiveRecord::Base
  attr_accessible :classroom_id, :end_date, :person_id, :person_type, :start_date

  # Relationships
  # ========================================================================
  belongs_to :classroom
  # make relationship with people (students and teachers) polymorphic
  belongs_to :assignable, :polymorphic => true 

end
