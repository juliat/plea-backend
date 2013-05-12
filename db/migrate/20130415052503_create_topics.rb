class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :number
      t.string :name
      t.integer :id
      
      t.timestamps
    end
  end
end
