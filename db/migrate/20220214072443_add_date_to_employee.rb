class AddDateToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :attendance_date, :date
    remove_column :employees, :designation
    remove_column :employees, :attendance
    remove_column :employees, :available
  end
end
