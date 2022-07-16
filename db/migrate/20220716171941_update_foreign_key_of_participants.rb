class UpdateForeignKeyOfParticipants < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :participants, :works
    add_foreign_key :participants, :works, on_delete: :cascade
  end
end
