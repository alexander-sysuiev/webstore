class Admin::BoilersController < Admin::BaseController
  before_filter :set_initial_data
  before_filter :check_boiler_params, :only => [:create, :update]

  def new
  end

  def create
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
  end

  def edit
  end

  def update
    settings_attrs = params[:boiler].delete(:settings)

    picture = Picture.create params[:boiler].delete(:picture) if params[:boiler][:picture].present?
    @boiler.picture.destroy if picture.present?
    attrs = picture.nil? ? params[:boiler] : params[:boiler].merge(:picture => picture)

    @boiler.update_attributes attrs

    Setting.delete_all ["id IN (?)", @boiler.settings.map(&:id)]
    @boiler.settings.create settings_attrs if settings_attrs.present?

    redirect_to category_boiler_path(@boiler.category_id, @boiler.id)
  end

private
  def set_initial_data
    @boiler = Boiler.find_by_id(params[:id]) || Boiler.new
    @settings_names = SettingName.all
  end
  
  def check_boiler_params
    path = @boiler.new_record? ? new_admin_boiler_path : edit_admin_boiler_path(@boiler)
    redirect_to path if params[:boiler].blank?
  end
end