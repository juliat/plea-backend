class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :user_id
end
