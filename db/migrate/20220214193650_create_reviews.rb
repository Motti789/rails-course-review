class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :comment
      t.integer :user_id
      t.integer :course_id


      t.timestamps
    end
  end
end
