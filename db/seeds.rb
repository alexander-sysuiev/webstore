# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


[:category, :boiler].each do |table|
	table.to_s.camelize.constantize.send(:delete_all)
end

coal_boilers = Category.create(:name => 'Coal Boilers')
gas_boilers = Category.create(:name => 'Gas Boilers')

[:category, :boiler]

wood_boilers = Category.create(:name => 'Wood Boilers')

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