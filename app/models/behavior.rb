class Behavior < ActiveRecord::Base
  attr_accessible :code, :name, :id

  # Relationships
  # ========================================================================
  has_many :student_behaviors
  has_many :behavior_instances, :through => :student_behaviors
  
end
