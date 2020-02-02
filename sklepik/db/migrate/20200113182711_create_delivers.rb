class CreateDelivers < ActiveRecord::Migration
  def change
    create_table :delivers do |t|
      t.string :name
      t.string :car
      t.integer :phone

      t.timestamps null: false
    end
  end
end
