class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
    @action = 'edit'
    @project = Project.find(params[:id])
    render 'edit'
  end

  def update
    @project =Project.find(params[:id])
    @project.update(project_params)
      redirect_to projects_path
    
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
      redirect_to projects_path   
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, employee_ids: [])
  end
end
