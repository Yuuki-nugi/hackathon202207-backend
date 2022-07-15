class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.references :work, foreign_key: true
      t.string :title, null:false
      t.string :result

      t.timestamps
    end
  end
end
