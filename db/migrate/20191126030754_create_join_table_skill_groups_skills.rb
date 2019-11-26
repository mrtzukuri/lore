class CreateJoinTableSkillGroupsSkills < ActiveRecord::Migration[5.2]
  def change
    create_join_table :skills, :skill_groups do |t|
      # t.index [:skill_id, :skill_group_id]
      # t.index [:skill_group_id, :skill_id]
    end
  end
end
