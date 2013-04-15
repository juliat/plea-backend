class CreateClassroomAssignments < ActiveRecord::Migration
  def change
    create_table :classroom_assignments do |t|
      t.integer :person_id
      t.integer :classroom_id
      t.string :person_type
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
