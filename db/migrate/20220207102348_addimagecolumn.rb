class Addimagecolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :file, :string
  end
end
