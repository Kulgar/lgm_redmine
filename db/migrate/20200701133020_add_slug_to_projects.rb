class AddSlugToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :slug, :string, limit: 60
  end
end
