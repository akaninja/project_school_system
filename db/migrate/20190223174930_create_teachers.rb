class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
