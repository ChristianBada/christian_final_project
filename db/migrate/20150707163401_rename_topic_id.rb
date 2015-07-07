class RenameTopicId < ActiveRecord::Migration
  def change
  	rename_column :discussions, :topics_id, :topic_id
  end
end
