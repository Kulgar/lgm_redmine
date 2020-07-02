json.extract! task, :id, :title, :priority, :content, :project_id, :created_at, :updated_at
json.url project_task_url(@project, task, format: :json)
