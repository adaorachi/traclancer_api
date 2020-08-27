class CreateProjectStages < ActiveRecord::Migration[6.0]
  def change
    create_table :project_stages do |t|
      t.string :title
      t.text :description
      t.float :rate
      t.boolean :share
      t.time :estimated_time
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
