class RemoveEventPictureFromLearningOpportunities < ActiveRecord::Migration[5.2]
  def change
    remove_column :learning_opportunities, :event_picture, :string
  end
end
