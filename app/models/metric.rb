class Metric < ActiveRecord::Base
  attr_accessible :name, :symbol

  # Relationships
  # ========================================================================
  has_many :day_metrics
  has_many :day_records, :through => :day_metrics

  # Scopes
  # ========================================================================
  scope :with_name, lambda{|name| where('name = ?', name)}
end
