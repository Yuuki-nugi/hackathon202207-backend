class CreateFeelingRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :feeling_records do |t|
      t.references :theme, foreign_key: true
      t.references :work, foreign_key: true
      t.integer :degree, null: false, default: 0

      t.timestamps
    end
  end
end
