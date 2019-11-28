class AddSkillsToProfessions < ActiveRecord::Migration[5.2]
  def change
    add_reference :professions, :skills, foreign_key: true
  end
end
