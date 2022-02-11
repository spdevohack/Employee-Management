class Adddesignationreferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :designation
  end
end
