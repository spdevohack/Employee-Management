class Removecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :Join_date
  end
end
