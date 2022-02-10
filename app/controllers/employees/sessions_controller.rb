# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # after_action :after_sign_in, only: [:create]
  # after_action :after_sign_out, only: [:destroy]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # def after_sign_in
  #   current_employee.update(attendance: "present")
  # end

  # def after_sign_out
  #   current_employee.update(attendance: "absent")
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
