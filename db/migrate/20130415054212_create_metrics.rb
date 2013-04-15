class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :symbol
      t.integer :value
      t.integer :day_record_id

      t.timestamps
    end
  end
end
