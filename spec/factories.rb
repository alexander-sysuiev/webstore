Factory.define :category, :class => Category do |f|
	f.sequence(:name){|i| "Category #{i}"}
end

Factory.define :boiler, :class => Boiler do |f|
	f.association(:category)
	f.name 'some boiler'
	f.price 123.00
end

Factory.define :order, :class => Order do |f|
    f.email 'email@email.com'
    f.sequence(:order_number){|i| 100 + i}
    f.phone '55512345'
    f.price 100.35
    f.name 'Alexander'
end
