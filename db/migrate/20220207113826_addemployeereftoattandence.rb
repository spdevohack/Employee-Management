class Addemployeereftoattandence < ActiveRecord::Migration[7.0]
  def change
    add_reference :attandences, :employee
  end
end
