class DayRecord < ActiveRecord::Base
  attr_accessible :chart_id, :date

  # Relationships
  # ========================================================================
  belongs_to :chart
  has_one :note, :as => :notable # polymorphic
  has_one :phase_line
  has_many :day_metrics
  has_many :metrics, :through => :day_metrics

  # accepts_nested_attributes_for :note, :allow_destroy => true

end
