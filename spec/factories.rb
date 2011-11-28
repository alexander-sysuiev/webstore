Factory.define :category, :class => Category do |f|
	f.sequence(:name){|i| "Category #{i}"}
end

Factory.define :boiler, :class => Boiler do |f|
	f.association(:category)
	f.name 'some boiler'
	f.price 123.00
end

