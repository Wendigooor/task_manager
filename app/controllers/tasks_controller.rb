class TasksController < ApplicationController
  load_and_authorize_resource :family
  load_and_authorize_resource :task, through: :family, shallow: true

  def new
  end

  def edit
    @task = Task.includes(comments: :comments).find(params[:id])
  end

  def index
    @author_tasks = current_user.author_tasks
  end

  def create
    @task.author = current_user
    @task.state = :opened

    if @task.save
      redirect_to family_tasks_path(@family)
    else
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to family_tasks_path(@family)
    else
      render :edit
    end
  end


private

  def task_params
    params.require(:task).permit(:description, :tag_list)
  end

end
