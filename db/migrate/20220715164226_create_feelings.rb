class CreateFeelings < ActiveRecord::Migration[6.1]
  def change
    create_table :feelings do |t|
      t.references :user, foreign_key: true
      t.references :work, foreign_key: true

      t.integer :degree, null: false, default: 0

      t.timestamps
    end
  end
end
