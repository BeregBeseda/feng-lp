class CreateApples < ActiveRecord::Migration
  def change
    create_table :apples do |t|
      t.string :name
      
      t.timestamps null: false  
    end  
  end
end
