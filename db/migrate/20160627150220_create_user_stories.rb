class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :param1
      t.string :param2
      t.string :param3
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
