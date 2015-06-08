class CreateCommetns < ActiveRecord::Migration
  def change
    create_table :commetns do |t|
      t.text :body
      t.references :user, index: true
      t.references :entry, index: true

      t.timestamps null: false
    end
    add_foreign_key :commetns, :users
    add_foreign_key :commetns, :entries
  end
end
