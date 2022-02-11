class DepartmentsController < ApplicationController
	def index
		@departments = Department.all.order(:name)
		# @departments = Department.search(params[:search])

	end

	def new
		@department =Department.new()
		# @designation = @department.designation.new()
	end


	def show
    @department = Department.find(params[:id])
    # @employee = @department.employees
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

  # def designation
  # 	@designation = Designation.new(dept_params)
  # end

  private
  # def des_params
  # 	params.require(:designation).permit(:name, )
  # end
  def dept_params
  	params.require(:department).permit(:name)
  end
end

