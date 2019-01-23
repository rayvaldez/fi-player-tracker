class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.float :cost
      t.integer :quantity

      t.timestamps
    end
  end
end
