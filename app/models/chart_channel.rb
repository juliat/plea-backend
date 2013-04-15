class ChartChannel < ActiveRecord::Base
  attr_accessible :channel_id, :chart_id

  # Relationships
  # ========================================================================
  belongs_to :chart
  belongs_to :channel
  
end
