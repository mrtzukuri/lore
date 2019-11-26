class CreateJoinTableLearningOpportunitiesSkills < ActiveRecord::Migration[5.2]
  def change
    create_join_table :learning_opportunities, :skills do |t|
      # t.index [:learning_opportunity_id, :skill_id]
      # t.index [:skill_id, :learning_opportunity_id]
    end
  end
end
