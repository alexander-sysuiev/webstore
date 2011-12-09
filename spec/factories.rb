Factory.define :category, :class => Category do |f|
	f.sequence(:name){|i| "Category #{i}"}
end

Factory.define :boiler, :class => Boiler do |f|
	f.association(:category)
    f.association(:picture)
	f.name 'some boiler'
	f.price 123.00
end

Factory.define :picture, :class => Picture do |f|
    f.sequence(:photo_file_name){|i| "photo_name#{i}.png" }
    f.photo_content_type "image/png"
    f.photo_file_size 1000
end

Factory.define :order, :class => Order do |f|
    f.email 'email@email.com'
    f.sequence(:order_number){|i| 100 + i}
    f.phone '55512345'
    f.price 100.35
    f.name 'Alexander'
end

Factory.define :admin, :class => Admin do |f|
    f.first_name 'Jack'
    f.last_name 'Kusto'
    f.sequence(:email){|i| "admin#{i}@webstore.com"}
    f.admin true
    f.password "password"
end
