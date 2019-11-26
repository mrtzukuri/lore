class CreateUserBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bookmarks do |t|
      t.references :learning_opportunity, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
