class OrganizationsController < ApplicationController
  before_action :authenticate_employee!, only: [:index]
	
	def index

	end
end
