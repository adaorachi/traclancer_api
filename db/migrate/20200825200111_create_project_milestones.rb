class CreateProjectMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :project_milestones do |t|
      t.string :title
      t.text :description
      t.time :alloted_time
      t.time :time_spent
      t.references :claimed_project, null: false, foreign_key: true
      t.references :project_stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
