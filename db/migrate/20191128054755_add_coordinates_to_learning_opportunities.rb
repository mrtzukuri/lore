class AddCoordinatesToLearningOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_column :learning_opportunities, :latitude, :float
    add_column :learning_opportunities, :longitude, :float
  end
end
