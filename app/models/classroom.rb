class Classroom < ActiveRecord::Base
  attr_accessible :number
  
  # Relationships
  # ========================================================================
  has_many :classroom_assignments
  
end
