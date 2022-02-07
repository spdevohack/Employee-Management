class AttandencesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@attandences = Attandence.all
	end

	def checkin
		@attandence = current_employee.attandences.new(att_params)
		if @attendance.save!
			@attandence.update(check_in: Time.now)
			# debugger
		end
	end

	def checkout
	end

	private
  def att_params
    params.require(:attandence).permit( :check_in, :check_out)
  end
end
