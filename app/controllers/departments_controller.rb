class DepartmentsController < ApplicationController
	def index
		@departments = Department.all.order(:name)
		# @departments = Department.search(params[:search])

	end

	def new
		@department =Department.new()
	end


	def show
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(dept_params) 
    if @department.save!
      redirect_to departments_path, notice: "New Department successfully Introduced"
    else
      render 'new'
    end
  end

  def edit
    @action = 'edit'
     @department = Department.find(params[:id])
     render 'edit'
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(dept_params)
      redirect_to departments_path, notice: "Department was successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy 
    redirect_to departments_path, notice: "Department was successfully deleted"
  end

  private
  def dept_params
  	params.require(:department).permit(:name)
  end
end

