class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :user_name

      t.timestamps
    end
  end
end
