class TopicSubtopic < ActiveRecord::Base
  attr_accessible :subtopic_id, :topic_id

  # Relationships
  # ========================================================================
  belongs_to :subtopic
  belongs_to :topic
end
