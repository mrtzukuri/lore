class AddSkillGroupToSkills < ActiveRecord::Migration[5.2]
  def change
    add_reference :skills, :skill_group, foreign_key: true
  end
end
