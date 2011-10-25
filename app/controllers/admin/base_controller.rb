class Admin::BaseController < WorkflowController
	before_filter :authenticate_admin!

	def show
	end

	def update
		admin = Admin.find(params[:id])
		admin.update_attributes params[:admin]
		redirect_to admin_root_path
	end

end