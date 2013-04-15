class ClassroomAssignment < ActiveRecord::Base
  attr_accessible :classroom_id, :end_date, :person_id, :person_type, :start_date
end
