class AddPriorityToUserStory < ActiveRecord::Migration
  def change
    add_column :user_stories, :priority, :integer
  end
end
