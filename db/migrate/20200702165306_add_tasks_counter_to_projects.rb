class AddTasksCounterToProjects < ActiveRecord::Migration[5.2]

  def change
    add_column :projects, :tasks_count, :integer

    reversible do |dir|
      dir.up do
        Project.all.each do |p|
          Project.reset_counters(p.id, :tasks)
        end
      end
    end
  end
end
