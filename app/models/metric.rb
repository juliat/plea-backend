class Metric < ActiveRecord::Base
  attr_accessible :day_record_id, :name, :symbol, :value

  # Relationships
  # ========================================================================
  has_one :note, :as => :notable # polymorphic
  belongs_to :day_record

end
