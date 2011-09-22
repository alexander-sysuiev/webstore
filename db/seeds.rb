[:category, :boiler, :service].each do |table|
	table.to_s.camelize.constantize.send(:delete_all)
end

coal_boilers = Category.create(:name => 'Coal Boilers')
gas_boilers = Category.create(:name => 'Gas Boilers')
wood_boilers = Category.create(:name => 'Wood Boilers')

mounting = Category.create(:name => 'Mounting')
repair = Category.create(:name => 'Repair')

boilers = Boiler.create(
	[
		{ :name => 'NK51', :price => 100.50, :category_id => coal_boilers.id},
		{ :name => 'PM12', :price => 13.43, :category_id => coal_boilers.id },
		{ :name => 'ALR44F', :price => 22.30, :category_id => gas_boilers.id },
		{ :name => 'Shit Happens', :price => 64.70, :category_id => gas_boilers.id },
		{ :name => 'BoilMe', :price => 200, :category_id => gas_boilers.id },
		{ :name => 'Gaser', :price => 50, :category_id => wood_boilers.id }
	]
)

services = Service.create(
	[
		{ :name => 'Wall Mounting', :category_id => mounting.id},
		{ :name => 'Floar Mounting', :category_id => mounting.id},
		{ :name => 'Celling Mounting', :category_id => mounting.id},
		{ :name => 'Cooler Rapair', :category_id => repair.id},
		{ :name => 'Block Repair', :category_id => repair.id},
		{ :name => 'Brain Repairment', :category_id => repair.id},
	]
)
