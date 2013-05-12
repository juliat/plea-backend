class Channel < ActiveRecord::Base
  attr_accessible :is_input, :name

  # Relationships
  # ========================================================================
  has_many :chart_channels
  has_many :charts, :through => :chart_channels

  # Scopes
  # ========================================================================
  scope :inputs, where('is_input = ?', true)
  scope :outputs, where('is_input = ?', false)
end
