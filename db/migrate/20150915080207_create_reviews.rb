class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end

    add_reference :reviews, :user, index: true, foreign_key: true
    add_reference :reviews, :resource, index: true, foreign_key: true
  end
end
