class AddMessagesToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :msg, :text
  end
end
