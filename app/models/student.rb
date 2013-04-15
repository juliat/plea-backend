class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :last_name

  # Relationships
  # ========================================================================
  has_many :classroom_assignments, :as => :assignable # polymorphic 
  has_many :charts

end
