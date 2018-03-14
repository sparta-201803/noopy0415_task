class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
    @task =Task.new
  end

  def show
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.save
    if @task.save
      redirect_to tasks_path
    else
      @tasks = Task.all
      flash.now[:alert] = @task.errors.full_messages
      render :index
    end
  end

  def update
    @task.update(task_params)
    if @task.update(task_params)
      redirect_to tasks_path
    else
      flash.now[:alert] = @task.errors.full_messages
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
