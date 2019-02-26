class AddFavoriteFieldToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :favorite, :boolean
  end
end
