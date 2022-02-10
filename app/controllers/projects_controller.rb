class ProjectsController < ApplicationController
  before_action :find_project, only: [ :team, :show ]
  before_action :find_employee, only: [ :add, :remove ]


  attr_accessor :employee, :project 

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new()
  end

  def create
    @project = Project.new(project_params)
    if @project.save!
      redirect_to projects_path, notice: "New Project Created"
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
      redirect_to projects_path, notice: "Project Updated!"
    
  end

  def show
    # @project = Project.find(params[:id])
    # @employees = Employee.where(active: true)

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project Deleted!!"   
  end

  def team
    # @employees = Employee.projects.present?
    @employees = Employee.where(active: true) 

  end

  def add
    # @employee = Employee.find(params[:id]) 
    @project = Project.find(params[:project_id])
    @project.employees << (@employee)
    redirect_to team_path,notice: "#{@employee.first_name} is Assigned to Project:#{@project.title} "
    
  end

  def remove
    @project = Project.find(params[:project_id]) 
    @project.employees.find(@employee.id).destroy
  end


  private
  def find_project
    @project  = Project.find(params[:id])
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :employee_ids )
  end
end
