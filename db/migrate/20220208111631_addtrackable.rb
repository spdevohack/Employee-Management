class Addtrackable < ActiveRecord::Migration[7.0]
  def change  

    add_column :employees, :sign_in_count, :integer, default: 0, null: false
    add_column :employees, :current_sign_in_at, :datetime
    add_column :employees, :last_sign_in_at, :datetime
    add_column :employees, :current_sign_in_ip, :string
    add_column :employees, :last_sign_in_ip, :string
    # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable
  end
end
