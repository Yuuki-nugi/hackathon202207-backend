class CreateThemeRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :theme_records do |t|
      t.references :theme, foreign_key: true
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
