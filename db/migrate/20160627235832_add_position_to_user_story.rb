class AddPositionToUserStory < ActiveRecord::Migration
  def change
    add_column :user_stories, :position, :interger, column_options: { null: false }
  end
  


end
