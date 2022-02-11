class EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: [:index]
	def index 
		@employees = Employee.search(params[:search])
	end

	def new
    @action = 'new'
		@employee = Employee.new()
	end

	def show
    @employee = Employee.find(params[:id])
    # render json: @post
  end

  def create
    @employee = Employee.new(employee_params) #link every employee with user 
    if @employee.save!
      redirect_to employees_path, notice: "#{@employee.first_name} successfully Added"
      # skip_confirmation! 
    else
      render 'new'
    end
  end

  def edit
    @action = 'edit'
     @employee = Employee.find(params[:id])
     render 'edit'
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.is_admin?
      @employee.update!(employee_params)
      sign_in(@employee, :bypass => true)
      redirect_to employees_path, notice: "Employee Details successfully updated"
    elsif  @employee.is_admin == false 
      @employee.update!(employee_params)
      sign_in(@employee, :bypass => true)
      redirect_to employee_path, notice: "Profile successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
     if @employee.update(active: false) && @employee.projects.destroy_all
        redirect_to employees_path, notice: "#{@employee.first_name} was successfully deleted"
    end
  end


  def signin
    if sign_in(@employee)
      current_employee.update(attendance: 'present')
    end
  end

  private
  def employee_params
  	params.require(:employee).permit(:first_name, :last_name, :email, :phone, :address, :salary, :gender, :join_date, :password, :designation, :active, :department_id, :file)
  end
end
