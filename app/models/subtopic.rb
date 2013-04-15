class Subtopic < ActiveRecord::Base
  attr_accessible :name

  # Relationships
  # ========================================================================
  has_many :topic_subtopics
  has_many :topics, :through => :topic_subtopics
  has_many :charts
end
