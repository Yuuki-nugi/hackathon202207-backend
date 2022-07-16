class UpdateForeignKeyOfFeelings < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :feelings, :works
    add_foreign_key :feelings, :works, on_delete: :cascade
  end
end
