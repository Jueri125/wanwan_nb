class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :prefecture_id, null: false
      t.text :content, null: false
      t.string :address, null: false
      t.integer :price, null: false
      t.string :star
      t.timestamps
    end
  end
end
