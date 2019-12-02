class AddColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:learning_opportunities, :price, 0)
  end
end
