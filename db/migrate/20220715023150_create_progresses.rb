class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|
      t.references :work, foreign_key: true
      t.references :theme, foreign_key: true

      t.timestamps
    end
  end
end
