class DayRecord < ActiveRecord::Base
  attr_accessible :chart_id, :date

  # Relationships
  # ========================================================================
  has_one :note, :as => :notable # polymorphic
  has_one :phase_line
  has_many :metrics

end
