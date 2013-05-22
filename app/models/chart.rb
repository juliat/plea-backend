class Chart < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :student_id, :subtopic_id, :topic_id

  # Relationships
  # ========================================================================
  belongs_to :student
  # channels
  has_many :chart_channels
  has_many :channels, :through => :chart_channels
  # topics and subtopics
  belongs_to :topic
  belongs_to :subtopic
  # day records
  has_many :day_records
  has_many :day_metrics, :through => :day_records
  has_many :metrics, :through => :day_metrics

  # Scopes
  # ========================================================================
  scope :current, where("end_date = ?", nil)
  scope :for_student, lambda{|student_id| where("student_id = ?", student_id.to_s)}
  scope :alphabetical, order("name ASC, start_date ASC")
  scope :metrics, joins(:metric)

  # Methods
  # ========================================================================
  def channels
    ChartChannel.for_chart(self.id).map{|chart_channel| Channel.find(chart_channel.channel_id).name}
  end

  def chart_name
    if self.name
      return self.name
    else
      return self.subtopic.name + ' - ' + self.channels.join('/')
    end
  end

end
