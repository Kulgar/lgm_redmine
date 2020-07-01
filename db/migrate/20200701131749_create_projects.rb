class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.boolean :archive, default: false
      t.text :description

      t.timestamps
    end
  end
end
