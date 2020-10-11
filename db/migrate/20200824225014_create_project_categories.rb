class CreateProjectCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :project_categories do |t|
      t.string :title
      t.string :slug
      t.text :description

      t.timestamps
    end
  end
end
