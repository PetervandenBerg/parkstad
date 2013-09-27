class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.boolean :attending
      t.text :msg

      t.timestamps
    end
  end
end
