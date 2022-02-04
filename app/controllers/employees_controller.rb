class EmployeesController < ApplicationController
	def index
		@employees = Employee.all.order(:id)	
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
      redirect_to root_path
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
      redirect_to employees_index_path(@employee), notice: "employee was successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_index_path, notice: "employee was successfully deleted"
  end

  private
  def employee_params
  	params.require(:employee).permit(:first_name, :last_name, :email, :phone, :address, :salary, :gender, :join_date, :password, :designation, :active, :department_id)
  end
end
