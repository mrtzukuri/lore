class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :learning_opportunities, :type, :course_type
    rename_column :learning_opportunities, :rl, :url
  end
end
