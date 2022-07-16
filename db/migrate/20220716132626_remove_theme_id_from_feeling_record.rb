class RemoveThemeIdFromFeelingRecord < ActiveRecord::Migration[6.1]
  def up
    remove_column :feeling_records, :theme_id
  end

  def down
    add_column :feeling_records, :theme_id, :references
  end
end
