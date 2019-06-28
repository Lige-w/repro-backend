class Api::V1::ProjectsController < ApplicationController
  def create
    @project = current_user.projects.build(project_params)
    if @project.valid?
      @project.save
      render json: @project
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
