class Channel < ActiveRecord::Base
  attr_accessible :is_input, :name

  # Relationships
  # ========================================================================
  has_many :chart_channels
  has_many :charts, :through => :chart_channels
  
end
