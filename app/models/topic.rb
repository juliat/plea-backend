class Topic < ActiveRecord::Base
  attr_accessible :name, :number

  # Relationships
  # ========================================================================
  has_many :topic_subtopics
  has_many :subtopics, :through => :topic_subtopics
  has_many :charts

end
