class CreateStudentBehaviors < ActiveRecord::Migration
  def change
    create_table :student_behaviors do |t|
      t.integer :student_id
      t.integer :behavior_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
