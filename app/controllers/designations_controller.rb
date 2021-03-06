class DesignationsController < ApplicationController
	before_action :dept_desig, only: [:new, :show]
	def index
		@designations = Designation.all
	end

	def new
		@designation = Designation.new()
	end

	def show
		# debugger
    @designation = @department.designations
  end

  def create
    @designation = Designation.new(des_params) 
    if @designation.save!
    	args = @designation.department_id
    	# debugger
      redirect_to department_path(args), notice: "New Designation successfully Introduced"
    else
      render 'new'
    end
  end

  def edit
  	@action = 'edit'
    @designation = Designation.find(params[:id])
    @department = @designation.department

    debugger
  end

   def update
    @designation = Designation.find(params[:id])
    if @designation.update(des_params)
      redirect_to designation_path(@designation.department.id), notice: "New Designation successfully Introduced"
    else
      render 'edit'
    end
  end

  def destroy
  	@designation = Designation.find(params[:id])
  	@designation.destroy
    redirect_to designation_path, notice: "Designation Removed"
  	
  end

  def designation
  	# debugger
  	@designations = Department.find(params[:department]).designations
  end

  private
  def des_params
  	params.require(:designation).permit(:name, :department_id )
  end

  def dept_desig
  	@department =Department.find(params[:id])
  	# debugger
  end


end
