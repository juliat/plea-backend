class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :user_id

  # Relationships
  # ========================================================================
  # belongs_to :user
  has_many :classroom_assignments, :as => :assignable # polymorphic 

end
