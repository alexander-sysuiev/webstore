class Admin::BaseController < WorkflowController
	before_filter :authenticate_admin!

	def show
	end

end