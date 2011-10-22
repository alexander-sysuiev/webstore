class Admin::SettingsController < Admin::BaseController
	def new
	end
	def create
		SettingName.create params[:setting]
		redirect_to admin_settings_path
	end
end