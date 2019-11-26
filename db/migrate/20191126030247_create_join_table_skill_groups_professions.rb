class CreateJoinTableSkillGroupsProfessions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :professions, :skill_groups do |t|
      # t.index [:profession_id, :skill_group_id]
      # t.index [:skill_group_id, :profession_id]
    end
  end
end
