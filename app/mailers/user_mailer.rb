class UserMailer < ApplicationMailer

  def new_task
    @user = params[:user]
    @project = params[:project]
    @url  = project_url(@project)
    # attachments['file.name']
    attachments.inline['logo.png'] = File.read(Rails.root.join("app/assets/images/logo.png"))
    mail(to: @user.email, subject: "A new task was created for project #{@project.title}")
  end

end
