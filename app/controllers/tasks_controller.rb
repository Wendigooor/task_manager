class TasksController < ApplicationController
  load_and_authorize_resource :family
  load_and_authorize_resource :task, through: :family, shallow: true

  def new
    # @parent_families = current_user.roles.where(resource_type: "Family", name: "admin")
    # @controllable_persons = Role.where(family_id: controllable_families.pluck(:id))
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
    params.require(:task).permit(:description)
  end

end
