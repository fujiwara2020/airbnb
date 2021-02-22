class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :fee
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
