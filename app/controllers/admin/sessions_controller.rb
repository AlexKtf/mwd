module Admin
  class SessionsController < Devise::SessionsController
    def new
      return redirect_to root_path if user_signed_in? && !current_user.admin
      render layout: 'admin'
    end

    def create
      user = User.find_by(email: params[:user][:email])
      return redirect_to root_path if user && !user.admin
      super
    end

    def after_sign_in_path_for resource
      admin_dashboard_index_path if request.path.starts_with?('/admin')
    end
  end
end
