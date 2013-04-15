class CreateTopicSubtopic < ActiveRecord::Migration
  def change
    create_table :topic_subtopics do |t|
      t.integer :topic_id
      t.integer :subtopic_id

      t.timestamps
    end
  end
end
