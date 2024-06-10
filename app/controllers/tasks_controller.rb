class TasksController < ApplicationController
  before_action :load_task, only: [:show, :update_state, :edit, :update]

  def index
    @tasks = current_user.tasks
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, fallback_location: root_path, notice: "Task created!!"
    else
      render :new
    end
  end

  def update_state
    @task.update(status: params[:task][:status])
    redirect_to @task, fallback_location: root_path, notice: "Status Updated"
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task, fallback_location: root_path, notice: "Updated"
    else
      render :edit
    end
  end

  private
  def load_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :desc, :deadline, :status)
  end
end
