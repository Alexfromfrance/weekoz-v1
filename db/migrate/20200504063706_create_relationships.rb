class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :trainer, null: false, foreign_key: { to_table: :users }
      t.integer :balance_course_group, default: 0
      t.integer :balance_course_perso, default: 0

      t.timestamps
    end
  end
end
