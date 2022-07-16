class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column :themes, :result, :string, null: false, default: ""
  end
end
