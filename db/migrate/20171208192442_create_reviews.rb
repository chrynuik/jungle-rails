class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.references :user, index: true
      t.references :product, index: true
      t.timestamps null: false
    end
  end
end
