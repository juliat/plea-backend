class Chart < ActiveRecord::Base
  attr_accessible :end_date, :name, :start_date, :student_id, :subtopic_id, :topic_id
end
