class AddRoonidToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :room_id, :integer
    add_column :bookings, :user_id, :integer
  end
end
