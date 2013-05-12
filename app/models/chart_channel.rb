class ChartChannel < ActiveRecord::Base
  attr_accessible :channel_id, :chart_id

  # Relationships
  # ========================================================================
  belongs_to :chart
  belongs_to :channel
  
  # Scopes
  # ========================================================================
  scope :for_chart, lambda{|chart_id| where('chart_id = ?', chart_id)}
end
