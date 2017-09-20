class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update]
  
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

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated"
      redirect_to root_path
    else 
      flash[:error] = "Project has not been updated"
      render :edit
    end 
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end