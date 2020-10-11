class CreateClaimedProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :claimed_projects do |t|
      t.integer :claimed_user_id
      t.boolean :claimed, default: false
      t.boolean :completed, default: false
      t.time :time_spent
      t.float :rate
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
