class CreateBasics < ActiveRecord::Migration
  def change
    create_table :basics do |t|
      t.string :firstname
      t.string :lastname
      t.string :manufacturer
      t.decimal :cost
      t.string :description
      t.string :color

      t.timestamps null: false
    end
  end
end
