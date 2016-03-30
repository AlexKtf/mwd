module Admin
  class AdminController < ApplicationController
    before_action :authorized_admin, unless: :devise_controller?

    layout 'admin'

    private

    def authorized_admin
      return redirect_to admin_path if not user_signed_in?
      return redirect_to root_path unless current_user.admin
    end
  end
end
