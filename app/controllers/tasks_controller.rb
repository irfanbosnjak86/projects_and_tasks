class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(tasks_params)
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.js { render 'edit.js'}
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to project_path(@project)
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :description, :deadline, :user_id)
  end
end