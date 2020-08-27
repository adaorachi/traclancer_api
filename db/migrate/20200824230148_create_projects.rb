class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.integer :owned_user_id
      t.integer :claimed_user_id
      t.boolean :claimed
      t.boolean :completed
      t.string :attachment_url
      t.belongs_to :project_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
