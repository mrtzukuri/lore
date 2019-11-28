class AddEventPictureToLearningOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_column :learning_opportunities, :event_picture, :string
  end
end
