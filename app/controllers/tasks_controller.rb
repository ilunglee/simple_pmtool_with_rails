class TasksController < ApplicationController

  before_action :find_task, only: [:show, :update, :edit, :destroy]
  
  def index
    @task = Task.all
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def find_task
    @task = Task.find params[:id]
  end

end
