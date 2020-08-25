class CreateMilestoneSubtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :milestone_subtasks do |t|
      t.string :title
      t.text :description
      t.references :project_milestone, null: false, foreign_key: true

      t.timestamps
    end
  end
end
