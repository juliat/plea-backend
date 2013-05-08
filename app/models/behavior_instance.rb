class BehaviorInstance < ActiveRecord::Base
  attr_accessible :date, :id, :time, :behavior_id

  # Relationships
  # ========================================================================
  belongs_to :behavior

end
