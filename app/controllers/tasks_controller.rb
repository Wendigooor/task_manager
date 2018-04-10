class TasksController < ApplicationController
  load_and_authorize_resource :family
  load_and_authorize_resource :task, through: :family, shallow: true

  def new
  end

  def edit
    @task = Task.includes(:categories, comments: :comments).find(params[:id])
    @task_categories = @task.categories
    @first_task_category = @task_categories.find_by(parent: nil)
    @second_task_category = @task_categories.find_by(parent: @first_task_category)
    @third_task_category = @task_categories.where.not(parent: nil).find_by(parent: @second_task_category)

    @first_categories = Category.roots
    @second_categories = Category.where(parent: @first_task_category)
    @third_categories = Category.where(parent: @second_task_category)
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
      @task.category_ids = params[:task][:categories].values
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
