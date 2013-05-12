class Subtopic < ActiveRecord::Base
  attr_accessible :name

  # Relationships
  # ========================================================================
  has_many :topic_subtopics
  has_many :topics, :through => :topic_subtopics
  has_many :charts

  # Scopes
  # ========================================================================
  scope :for_topic, lambda{|topic_id| joins(:topic_subtopics).where('topic_id = ?', topic_id)}
  
end
