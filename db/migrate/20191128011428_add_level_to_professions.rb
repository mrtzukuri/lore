class AddLevelToProfessions < ActiveRecord::Migration[5.2]
  def change
    add_column :professions, :level, :string
  end
end
