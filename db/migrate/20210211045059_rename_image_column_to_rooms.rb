class RenameImageColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :image, :room_image
  end
end
