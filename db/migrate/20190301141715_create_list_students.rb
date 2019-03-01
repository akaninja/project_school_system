class CreateListStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :list_students do |t|
      t.references :list, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
