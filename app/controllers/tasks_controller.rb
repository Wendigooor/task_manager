class TasksController < ApplicationController
  load_and_authorize_resource :family
  load_and_authorize_resource :task, through: :family, shallow: true

  def new
  end

  def index
    @author_tasks = TaskDecorator.decorate_collection(current_user.author_tasks)
  end

  def create
    @task.author = current_user
    if @task.save
      redirect_to family_tasks_path(@family)
    else
      render :new
    end
  end


private

  def task_params
    params.require(:task).permit(:description, :tag_list)
  end

end
