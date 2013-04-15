class CreatePhaseLines < ActiveRecord::Migration
  def change
    create_table :phase_lines do |t|
      t.integer :day_record_id
      t.string :title

      t.timestamps
    end
  end
end
