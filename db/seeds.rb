[:category, :boiler, :service, :picture, :admin, :setting_name].each do |table|
	table.to_s.camelize.constantize.send(:delete_all)
end

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
		{ :name => 'NK51', :price => 100.50, :category_id => coal_boilers.id, :picture => boiler_pictures[0]},
		{ :name => 'PM12', :price => 13.43, :category_id => coal_boilers.id, :picture => boiler_pictures[1] },
		{ :name => 'ALR44F', :price => 22.30, :category_id => gas_boilers.id, :picture => boiler_pictures[2] },
		{ :name => 'Shit Happens', :price => 64.70, :category_id => gas_boilers.id, :picture => boiler_pictures[3] },
		{ :name => 'BoilMe', :price => 200, :category_id => gas_boilers.id, :picture => boiler_pictures[4] },
		{ :name => 'Gaser', :price => 50, :category_id => wood_boilers.id, :picture => boiler_pictures[5] }
	]
)

services = Service.create(
	[
		{ :name => 'Wall Mounting', :category_id => mounting.id, :picture => service_pictures[0]},
		{ :name => 'Floar Mounting', :category_id => mounting.id, :picture => service_pictures[1]},
		{ :name => 'Ceilling Mounting', :category_id => mounting.id, :picture => service_pictures[2]},
		{ :name => 'Cooler Rapair', :category_id => repair.id, :picture => service_pictures[3]},
		{ :name => 'Block Repair', :category_id => repair.id, :picture => service_pictures[4]},
		{ :name => 'Brain Repairment', :category_id => repair.id, :picture => service_pictures[5]},
	]
)
