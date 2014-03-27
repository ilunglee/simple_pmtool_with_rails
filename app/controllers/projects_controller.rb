class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find (params[:id])
  end

  def edit
    @project = Project.find (params[:id])
    render :new
  end

  def update
    @project = Project.find (params[:id])
    @project.update_attributes(project_attributes)

    if @project.save
      redirect_to projects_path
    else
      flash.now[:error] = "please correct the form"
      render :new
    end
  end

  def create
    @project = Project.new(project_attributes)
    
    if @project.save
      redirect_to projects_path
    else
      flash.now[:error] = "please correct the form"
      render :new
    end
  end

  def destroy
    @project = Project.find (params[:id])
    @project.destroy
    
    redirect_to projects_path
  end

  private

  def project_attributes
    params.require(:project).permit( [:title, :description] )
  end

end
