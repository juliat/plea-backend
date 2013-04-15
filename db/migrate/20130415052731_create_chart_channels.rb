class CreateChartChannels < ActiveRecord::Migration
  def change
    create_table :chart_channels do |t|
      t.integer :chart_id
      t.integer :channel_id

      t.timestamps
    end
  end
end
