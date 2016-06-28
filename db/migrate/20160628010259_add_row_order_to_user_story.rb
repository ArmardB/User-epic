class AddRowOrderToUserStory < ActiveRecord::Migration
  def change
    add_column :user_stories, :row_order, :integer
  end
end
