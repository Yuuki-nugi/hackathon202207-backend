class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :Work_name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
