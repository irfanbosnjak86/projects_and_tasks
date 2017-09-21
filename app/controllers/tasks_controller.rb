class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    if @project.tasks.any?
      task = @project.tasks.order(position: :asc).last
      last_task_position = task.position
    else
      last_task_position = 1
    end
    
    @task = @project.tasks.create(tasks_params.merge(position: last_task_position + 1))
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js { render 'edit.js'}
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.update(tasks_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  def set_status
    @task = Task.find(params[:id])
    @task.update_attribute(:done, params[:completed])
  end

  def up  
    @project = Project.find(params[:project_id])
    task = Task.find(params[:id])
    redirect_to project_path(@project) if task.position == 1
    previous_task = Task.find_by_position(task.position - 1)
    task.update(position: task.position - 1)
    previous_task.update(position: task.position + 1)
    redirect_to project_path(@project)
  end

  def down 
    @project = Project.find(params[:project_id])
    task = Task.find(params[:id])
    next_task = Task.find_by_position(task.position + 1)
    if next_task.nil?
      redirect_to project_path(@project)
    else
      task.update(position: task.position + 1)
      next_task.update(position: task.position - 1)
      redirect_to project_path(@project)
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :description, :deadline, :user_id)
  end
end