[:category, :boiler, :service, :admin, :setting_name].each do |table|
	table.to_s.camelize.constantize.send(:delete_all)
end

Picture.all.each(&:destroy)

admin = Admin.create(:first_name => 'Store',
  				     :last_name => 'Admin',
					 :email => 'admin@webstore.com',
					 :password => 'admin',
					 :password_confirmation => 'admin')

[:weight, :height, :capacity, :waid].each do |name|
	SettingName.create :name => name	
end

coal_boilers = Category.create(:name => 'Coal Boilers', :kind => 'boiler')
gas_boilers = Category.create(:name => 'Gas Boilers', :kind => 'boiler')
wood_boilers = Category.create(:name => 'Wood Boilers', :kind => 'boiler')

mounting = Category.create(:name => 'Mounting', :kind => 'service')
repair = Category.create(:name => 'Repair', :kind => 'service')

boiler_pictures = []
['boiler1', 'boiler2', 'boiler3', 'boiler4', 'boiler5', 'boiler6'].each do |name|
	f = File.open "uploads/boiler_pictures/#{name}.png"
	boiler_pictures << Picture.create(:photo => f)
end

service_pictures = []
['service1', 'service2', 'service3', 'service4', 'service5', 'service6'].each do |name|
	f = File.open "uploads/service_pictures/#{name}.png"
	service_pictures << Picture.create(:photo => f)
end

boilers = Boiler.create(
	[
		{ :name => 'NK51', :price => 100.50, :category_id => coal_boilers.id, :picture => boiler_pictures[0], :description => 'Boiler1'},
		{ :name => 'PM12', :price => 13.43, :category_id => coal_boilers.id, :picture => boiler_pictures[1], :description => 'Boiler2' },
		{ :name => 'ALR44F', :price => 22.30, :category_id => gas_boilers.id, :picture => boiler_pictures[2], :description => 'Boiler3' },
		{ :name => 'Shit Happens', :price => 64.70, :category_id => gas_boilers.id, :picture => boiler_pictures[3], :description => 'Boiler4' },
		{ :name => 'BoilMe', :price => 200, :category_id => gas_boilers.id, :picture => boiler_pictures[4], :description => 'Boiler5' },
		{ :name => 'Gaser', :price => 50, :category_id => wood_boilers.id, :picture => boiler_pictures[5], :description => 'Boiler6' }
	]
)

services = Service.create(
	[
		{ :price => 100.50, :name => 'Wall Mounting', :category_id => mounting.id, :picture => service_pictures[0], :description => 'Service1'},
		{ :price => 33.10, :name => 'Floar Mounting', :category_id => mounting.id, :picture => service_pictures[1], :description => 'Service1'},
		{ :price => 41.00, :name => 'Ceilling Mounting', :category_id => mounting.id, :picture => service_pictures[2], :description => 'Service1'},
		{ :price => 1.20, :name => 'Cooler Rapair', :category_id => repair.id, :picture => service_pictures[3], :description => 'Service1'},
		{ :price => 67.30, :name => 'Block Repair', :category_id => repair.id, :picture => service_pictures[4], :description => 'Service1'},
		{ :price => 84.43, :name => 'Brain Repairment', :category_id => repair.id, :picture => service_pictures[5], :description => 'Service1'},
	]
)

boilers.each_with_index do |boiler, index|
	boiler.settings.create :setting_name => SettingName.first, :value => index * 10
end

