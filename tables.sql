create database some_hotel;
use some_hotel;

create table guests(
	id int primary key,
	first_name varchar (50),
	last_name varchar (50),
	phone varchar (20),
	email varchar (50),
	adress varchar (50)
);

create table rooms(
	id int primary key, 
	room_number int,
	floor_number int, 
	room_type int,
	price_per_night decimal
);

create table bookings(
	id int primary key,
	guest_id int,
	room_id int,
	check_in_id date,
	check_out_id date,
	room_total_amount decimal,
	total_amount decimal,
	status varchar (20),
	foreign key(guest_id) references guests (id),
	foreign key(room_id) references rooms (id)
);

create table services(
	id int primary key,
	service_name varchar (50),
	service_description varchar (500),
	price decimal
);

create table guests_services(
	id int primary key,
	booking_id int,
	service_id int,
	service_date date,
	quantity int,
	amount decimal,
	foreign key(booking_id) references bookings (id),
	foreign key(service_id) references services (id)	
);

create table payments(
	id int primary key,
	booking_id int,
	payment_date date,
	amount decimal,
	payment_method varchar(50),
	status varchar (20),
	foreign key(booking_id) references bookings (id)
);
