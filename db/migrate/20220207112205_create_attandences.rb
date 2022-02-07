class CreateAttandences < ActiveRecord::Migration[7.0]
  def change
    create_table :attandences do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.timestamps
    end
  end
end
