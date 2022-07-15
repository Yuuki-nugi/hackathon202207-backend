class RenameWorkNameColumnToWorks < ActiveRecord::Migration[6.1]
  def change
    rename_column :works, :Work_name, :work_name
  end
end
