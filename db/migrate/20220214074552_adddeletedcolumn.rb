class Adddeletedcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :designation, :integer
    add_column :employees, :attendance, :integer
  end
end
