class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.integer :id
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
