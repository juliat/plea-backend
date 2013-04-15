class Slice < ActiveRecord::Base
  attr_accessible :chart_id, :name, :phase_line_id

  # Relationships
  # ========================================================================
  has_one :note, :as => :notable # polymorphic
  belongs_to :phase_line


  # Methods
  # ========================================================================
  # get the chart to which this slice belongs
  def get_chart
  	self.phase_line.day_record.chart
  end

end
