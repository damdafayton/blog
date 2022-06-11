class UpdateDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    ## Confirmable for Devise
    add_column :users, :confirmation_token, :string  
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
  end
end
