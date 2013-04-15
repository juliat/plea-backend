class CreateDayRecords < ActiveRecord::Migration
  def change
    create_table :day_records do |t|
      t.string :chart_id
      t.date :date

      t.timestamps
    end
  end
end
