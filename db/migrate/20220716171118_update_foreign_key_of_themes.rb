class UpdateForeignKeyOfThemes < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :themes, :works
    add_foreign_key :themes, :works, on_delete: :cascade
  end
end
