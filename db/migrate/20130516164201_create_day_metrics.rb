class CreateDayMetrics < ActiveRecord::Migration
  def change
    create_table :day_metrics do |t|
      t.integer :day_record_id
      t.integer :metric_id
      t.integer :metric_value

      t.timestamps
    end
  end
end
