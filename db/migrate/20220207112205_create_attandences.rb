class CreateAttandences < ActiveRecord::Migration[7.0]
  def change
    create_table :attandences do |t|
      t.string :check_in
      t.string :datetime
      t.string :check_out
      t.string :datetime

      t.timestamps
    end
  end
end
