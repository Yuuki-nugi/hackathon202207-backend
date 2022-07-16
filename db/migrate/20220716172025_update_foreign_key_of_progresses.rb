class UpdateForeignKeyOfProgresses < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :progresses, :works
    add_foreign_key :progresses, :works, on_delete: :cascade
    remove_foreign_key :progresses, :themes
    add_foreign_key :progresses, :themes, on_delete: :cascade
  end
end
