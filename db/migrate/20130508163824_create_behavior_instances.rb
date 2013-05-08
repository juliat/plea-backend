class CreateBehaviorInstances < ActiveRecord::Migration
  def change
    create_table :behavior_instances do |t|
      t.integer :id
      t.date :date
      t.string :time

      t.timestamps
    end
  end
end
