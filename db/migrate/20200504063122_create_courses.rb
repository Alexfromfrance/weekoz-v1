class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :course_type
      t.string :address
      t.datetime :start
      t.datetime :end
      t.integer :min_participants
      t.integer :max_participants
      t.integer :price
      t.boolean :prepayment
      t.references :trainer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
