class Addattendancetoemployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :available, :boolean, default: false
    add_column :employees, :appearance, :string
    add_column :employees, :attendance_count, :integer
  end
end
