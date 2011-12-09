class Admin::BoilersController < Admin::BaseController
	def new
		@boiler = Boiler.new
		@settings_names = SettingName.all
	end

	def create
		@boiler = Boiler.new
		@settings_names = SettingName.all
		if params[:boiler]
			picture = Picture.create params[:boiler].delete(:picture)
			settings_attrs = params[:boiler].delete(:settings)
			boiler_attrs = params[:boiler]
			boiler_attrs.merge!(:picture => picture) if picture.present?
			if boiler = Boiler.create(boiler_attrs)
				boiler.settings.create settings_attrs if settings_attrs.present?

				redirect_to category_boiler_path(:category_id => boiler.category_id, :id => boiler.id)
			else
				render new_admin_boiler_path
			end
		else
			render new_admin_boiler_path
		end

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
		boiler.settings.create settings_attrs if settings_attrs.present?

		redirect_to category_boiler_path(boiler.category_id, boiler.id)
	end
end