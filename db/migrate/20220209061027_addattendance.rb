class Addattendance < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :attendance, :integer
  end
end
