class AddUserIdToLearningOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_reference :learning_opportunities, :user, foreign_key: true
  end
end
