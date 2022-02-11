class Addconfirmable < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :confirmation_token, :string
    add_column :employees, :confirmed_at, :datetime
    add_column :employees, :confirmation_sent_at, :datetime
    add_column :employees, :unconfirmed_email, :string
  end
end
