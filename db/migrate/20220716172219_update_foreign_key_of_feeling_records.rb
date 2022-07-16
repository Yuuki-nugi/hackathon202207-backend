class UpdateForeignKeyOfFeelingRecords < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :feeling_records, :works
    add_foreign_key :feeling_records, :works, on_delete: :cascade
  end
end
