class UserMailer < ApplicationMailer

  def new_task
    @user = params[:user]
    @project = params[:project]
    @url  = project_url(@project)
    mail(to: @user.email, subject: "A new task was created for project #{@project.title}")
  end

end
