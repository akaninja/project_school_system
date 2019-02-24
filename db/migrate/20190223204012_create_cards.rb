class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.float :price
      t.integer :classes
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
