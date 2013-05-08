class Behavior < ActiveRecord::Base
  attr_accessible :code, :id, :name, :student_id

  # Relationships
  # ========================================================================
  belongs_to :student
  has_many :behavior_instances
  
end
