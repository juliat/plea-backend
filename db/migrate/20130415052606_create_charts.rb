class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :topic_id
      t.string :subtopic_id
      t.string :student_id
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
