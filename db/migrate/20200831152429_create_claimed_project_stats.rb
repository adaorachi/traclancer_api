class CreateClaimedProjectStats < ActiveRecord::Migration[6.0]
  def change
    create_table :claimed_project_stats do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :record_time
      t.integer :project_stage
      t.references :claimed_project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
