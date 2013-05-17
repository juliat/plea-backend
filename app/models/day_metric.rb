class DayMetric < ActiveRecord::Base
    attr_accessible :day_record_id, :metric_id, :metric_value

	# Relationships
	# ========================================================================
	belongs_to :day_record
	belongs_to :metric
	has_one :note, :as => :notable # polymorphic

end
