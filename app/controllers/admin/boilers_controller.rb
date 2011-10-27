class Admin::BoilersController < Admin::BaseController
	def new
		@boiler = Boiler.new
		@settings_names = SettingName.all
	end

	def create
		picture = Picture.create params[:boiler].delete(:picture)
		settings_attrs = params[:boiler].delete(:settings)
		boiler = Boiler.create params[:boiler].merge(:picture => picture)
		boiler.settings.create settings_attrs
		redirect_to category_boiler_path(:category_id => boiler.category_id, :id => boiler.id)
	end

	def edit
		@boiler = Boiler.find(params[:id])
		@settings_names = SettingName.all
	end

	def update
		boiler = Boiler.find params[:id]
		settings_attrs = params[:boiler].delete(:settings)

		picture = Picture.create params[:boiler].delete(:picture) if params[:boiler][:picture].present?
		boiler.picture.destroy if picture.present?
		attrs = picture.nil? ? params[:boiler] : params[:boiler].merge(:picture => picture)
		
		boiler.update_attributes attrs

		Setting.delete_all ["id IN (?)", boiler.settings.map(&:id)]
		boiler.settings.create settings_attrs

		redirect_to category_boiler_path(boiler.category_id, boiler.id)
	end
end