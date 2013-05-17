class BehaviorInstance < ActiveRecord::Base
  attr_accessible :date, :id, :time, :student_behavior_id

  # Relationships
  # ========================================================================
  belongs_to :student_behavior

  # Constants
  # ========================================================================
  TIMES = ['9:00am', '9:15am', '9:30am', '9:45am', '10:00am', '10:15am', '10:30am', '10:45am', '11:00am', '11:15am', '11:30am', '11:45am', '12:00pm', '12:15pm', '12:30pm', '12:45pm', '1:00pm', '1:15pm', '1:30pm', '1:45pm', '2:00pm', '2:30pm', '2:45pm', '3:00pm']

  # Methods
  # ========================================================================
  def behavior_id
  	self.student_behavior.behavior_id
  end

  def student_id
  	self.student_behavior.student_id
  end
end
