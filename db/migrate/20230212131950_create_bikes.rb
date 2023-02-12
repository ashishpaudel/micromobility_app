class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.string :number, unique: true, null: false
      t.string :location, unique: true, null: false
    
      t.timestamps
    end
    add_index :bikes, [:location, :number], unique: true
  end
end
