class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(project_attributes)
      redirect_to projects_path
    else
      flash.now[:error] = "please correct the form"
      render :new
    end
  end

  def create
    @project = Project.new(project_attributes)
    
    if @project.save
      redirect_to @project
    else
      flash.now[:error] = "please correct the form"
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_attributes
    params.require(:project).permit( [:title, :description] )
  end

end
