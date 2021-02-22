class Reservations < ActiveRecord::Migration[6.1]
  def change
    drop_table :Reservations
  end
end
