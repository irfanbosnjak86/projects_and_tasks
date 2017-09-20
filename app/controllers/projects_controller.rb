class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.new 
  end

  def create
    @project = current_user.projects.new(project_params)
    
    if @project.save 
      flash[:notice] = "Project has been created"
      redirect_to root_path
    else 
      flash[:error] = "Project has not been created"
      render :new
    end 
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id)
  end
end