class AddTimeCommitmentToLearningOpportunities < ActiveRecord::Migration[5.2]
  def change
    add_column :learning_opportunities, :time_commitment, :integer
  end
end
