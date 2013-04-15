class CreateSlice < ActiveRecord::Migration
  def change
    create_table :slice do |t|
      t.string :name
      t.integer :chart_id
      t.integer :phase_line_id

      t.timestamps
    end
  end
end
