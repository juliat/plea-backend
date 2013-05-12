class CreateBehaviorInstances < ActiveRecord::Migration
  def change
    create_table :behavior_instances do |t|
      t.integer :id
      t.date :date
      t.string :time
      t.integer :student_behavior_id
      
      t.timestamps
    end
  end
end
