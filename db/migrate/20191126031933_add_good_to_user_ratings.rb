class AddGoodToUserRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :user_ratings, :good, :boolean
  end
end
