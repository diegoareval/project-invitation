class Projects::ProjectUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    project_user = @project.project_users.new(project_user_params)
    project_user.project = @project

    if project_user.save
      redirect_to @project, notice: "Success"
    else
      redirect_to @project, alert: "Failure"
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def project_user_params
    params.require(:project_user).permit(:email)
  end
end