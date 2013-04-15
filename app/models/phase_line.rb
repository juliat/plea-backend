class PhaseLine < ActiveRecord::Base
  attr_accessible :day_record_id, :title

  # Relationships
  # ========================================================================
  has_one :note, :as => :notable # polymorphic
  belongs_to :day_record
  has_one :slice

end
