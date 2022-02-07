class DepartmentsController < ApplicationController
	def index
		@departments = Department.all.order(:id)
		# @departments = Department.search(params[:search])
		
	end

	def new
		@department =Department.new()
	end


	def show
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(dept_params) #link every department with user 
    if @department.save!
      redirect_to department_path
      # PostSendMail.new(@department).send_mail      #Using services for Sending mail 
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
      redirect_to departments_path, notice: "department was successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy 
    redirect_to departments_path, notice: "department was successfully deleted"
  end

  private
  def dept_params
  	params.require(:department).permit(:name)
  end
end

