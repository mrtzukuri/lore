class CreateUserRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ratings do |t|
      t.references :user, foreign_key: true
      t.references :learning_opportunity, foreign_key: true

      t.timestamps
    end
  end
end
