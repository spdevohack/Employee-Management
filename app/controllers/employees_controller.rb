class EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: [:index]
	def index
		@employees = Employee.search(params[:search])
	end

	def new
		@employee = Employee.new()
	end

	def show
    @employee = Employee.find(params[:id])
    # render json: @post
  end

  def create
    @employee = Employee.new(employee_params) #link every employee with user 
    if @employee.save!
      redirect_to employees_path
      # PostSendMail.new(@employee).send_mail      #Using services for Sending mail 
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
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "employee was successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
     if @employee.update(active: false) 
        redirect_to employees_path, notice: "employee was successfully deleted"
    end
  end

  private
  def employee_params
  	params.require(:employee).permit(:first_name, :last_name, :email, :phone, :address, :salary, :gender, :join_date, :password, :designation, :active, :department_id)
  end
end
