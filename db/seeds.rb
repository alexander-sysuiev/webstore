[:category, :boiler, :service, :admin, :setting_name, :goods_order, :order].each do |table|
	table.to_s.camelize.constantize.send(:delete_all)
end

# Picture.all.each(&:destroy)

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

description = <<-EOS
	The direct vent, sealed combustion boiler has an ultra-high 97.3% efficiency and is ENERGY STAR approved!
	The Peerless PUREFIRE PF-110, now available in six sizes, has ASME and ETL certifications for both the
	U.S. and Canada and is the most thoroughly tested high efficiency boiler on the market!
	A unique condensate system with built-in neutralizer component and float switch protection is a top
	feature of the boiler. Features and Benefits of Peerless PUREFIRE PF boiler at a glance:
	Stainless steel heat exchanger.
	The heart of the Peerless PureFire boiler is the ASME-certified stainless steel heat exchanger.
EOS

boilers = Boiler.create(
	[
		{ :name => 'NK51', :price => 100.50, :category_id => coal_boilers.id, :picture => boiler_pictures[0], :description => description},
		{ :name => 'PM12', :price => 13.43, :category_id => coal_boilers.id, :picture => boiler_pictures[1], :description => description },
		{ :name => 'ALR44F', :price => 22.30, :category_id => gas_boilers.id, :picture => boiler_pictures[2], :description => description },
		{ :name => 'Shit Happens', :price => 64.70, :category_id => gas_boilers.id, :picture => boiler_pictures[3], :description => description },
		{ :name => 'BoilMe', :price => 200, :category_id => gas_boilers.id, :picture => boiler_pictures[4], :description => description },
		{ :name => 'Gaser', :price => 50, :category_id => wood_boilers.id, :picture => boiler_pictures[5], :description => description }
	]
)

services = Service.create(
	[
		{ :price => 100.50, :name => 'Wall Mounting', :category_id => mounting.id, :picture => service_pictures[0], :description => description},
		{ :price => 33.10, :name => 'Floar Mounting', :category_id => mounting.id, :picture => service_pictures[1], :description => description},
		{ :price => 41.00, :name => 'Ceilling Mounting', :category_id => mounting.id, :picture => service_pictures[2], :description => description},
		{ :price => 1.20, :name => 'Cooler Rapair', :category_id => repair.id, :picture => service_pictures[3], :description => description},
		{ :price => 67.30, :name => 'Block Repair', :category_id => repair.id, :picture => service_pictures[4], :description => description},
		{ :price => 84.43, :name => 'Brain Repairment', :category_id => repair.id, :picture => service_pictures[5], :description => description},
	]
)

boilers.each_with_index do |boiler, index|
	boiler.settings.create :setting_name => SettingName.first, :value => index * 10
end

