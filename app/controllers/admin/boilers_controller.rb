class Admin::BoilersController < Admin::BaseController
  before_filter :set_initial_data
  before_filter :check_boiler_params, :only => [:create, :update]
  before_filter :generate_picture, :only => [:create, :update]
  before_filter :setting_attributes, :only => [:create, :update]

  def new
  end

  def create
    boiler_attrs = params[:boiler].merge(:picture => @picture)
    if boiler = Boiler.create(boiler_attrs)
      boiler.settings.create @settings_attrs if @settings_attrs.present?
      redirect_to category_boiler_path(:category_id => boiler.category_id, :id => boiler.id)
    else
      render new_admin_boiler_path
    end
  end

  def edit
  end

  def update
    old_picture = @boiler.picture
    attrs = params[:boiler].merge(:picture => @picture)

    if @boiler.update_attributes attrs
      old_picture.destroy if @picture.present?
      Setting.delete_all ["id IN (?)", @boiler.settings.map(&:id)]
      @boiler.settings.create @settings_attrs if @settings_attrs.present?

      redirect_to category_boiler_path(@boiler.category_id, @boiler.id)
    else
      render edit_admin_boiler_path(@boiler)
    end
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
  
  def generate_picture
     @picture = Picture.build params[:boiler].delete(:picture) if params[:boiler][:picture].present?
  end
  
  def setting_attributes
    @settings_attrs = params[:boiler].delete(:settings)
  end
end