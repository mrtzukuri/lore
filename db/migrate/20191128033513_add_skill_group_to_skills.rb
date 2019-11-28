class AddSkillGroupToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :skill_group, :string
  end
end
