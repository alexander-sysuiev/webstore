class AdminsController < WorkflowController
	before_filter :authenticate_admin!

end