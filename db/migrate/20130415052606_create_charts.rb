class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.integer :topic_id
      t.integer :subtopic_id
      t.integer :student_id
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
