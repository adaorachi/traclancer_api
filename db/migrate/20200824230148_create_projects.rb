class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.integer :owned_user_id
      t.string :skill_set
      t.boolean :request_share, default: false
      t.string :attachment_url
      t.belongs_to :project_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
