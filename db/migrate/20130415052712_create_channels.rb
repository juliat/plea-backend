class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.boolean :is_input
      t.string :name

      t.timestamps
    end
  end
end
