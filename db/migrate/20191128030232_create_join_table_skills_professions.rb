class CreateJoinTableSkillsProfessions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :skills, :professions do |t|
      # t.index [:skill_id, :profession_id]
      # t.index [:profession_id, :skill_id]
    end
  end
end
