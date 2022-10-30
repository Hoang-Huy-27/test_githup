create database learn_database

create table learn_database.product(
	id int auto_increment,
    name varchar(50) not null,
	price int not null,
	description text,
	category_id int not null,
	sub_category_id int not null,
	img_product_id int not null,
	promotion_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.product
ADD CONSTRAINT FK_category
FOREIGN KEY (category_id) REFERENCES category(id)

ALTER TABLE learn_database.product
ADD CONSTRAINT FK_sub_category
FOREIGN KEY (sub_category_id) REFERENCES sub_category(id)

ALTER TABLE learn_database.product
ADD CONSTRAINT FK_img_product
FOREIGN KEY (img_product_id) REFERENCES product_img(id)

ALTER TABLE learn_database.product
ADD CONSTRAINT FK_promotion
FOREIGN KEY (promotion_id) REFERENCES promotion(id)

create table learn_database.user(
	id int auto_increment,
	name varchar(50) not null,
	password varchar(50) not null,
	address varchar(50) not null,
	email varchar(50) not null,
	phone_number varchar(13) not null,
    primary key(id)
)

create table learn_database.category(
	id int auto_increment,
	name varchar(50) not null,
    primary key(id)
)

create table learn_database.sub_category(
	id int auto_increment,
	name varchar(50) not null,
	category_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.sub_category
ADD CONSTRAINT FK_categorys
FOREIGN KEY (category_id) REFERENCES category(id)

create table learn_database.orders(
	id int auto_increment,
	date date not null,
	status bit not null,
	price int not null,
	quantity int not null,
	user_id int not null,
	product_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.orders
ADD CONSTRAINT FK_user
FOREIGN KEY (user_id) REFERENCES user(id)

ALTER TABLE learn_database.orders
ADD CONSTRAINT FK_product
FOREIGN KEY (product_id) REFERENCES product(id)

create table learn_database.order_detail(
	id int auto_increment,
	price int not null,
	quantity int not null,
	order_id int not null,
	product_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.order_detail
ADD CONSTRAINT FK_order
FOREIGN KEY (order_id) REFERENCES orders(id)

ALTER TABLE learn_database.order_detail
ADD CONSTRAINT FK_products
FOREIGN KEY (product_id) REFERENCES product(id)

create table learn_database.promotion(
	id int auto_increment,
	name varchar(50) not null,
	value varchar(10) not null,
	gift_code varchar(10) not null,
	date datetime not null,
	product_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.promotion
ADD CONSTRAINT FK_productss
FOREIGN KEY (product_id) REFERENCES product(id)

create table learn_database.roles(
	id int auto_increment,
	name varchar(50) not null,
	level int not null,
	created_at timestamp not null,
	updated_at timestamp not null,
    primary key(id)
)

create table learn_database.user_roles(
	id int auto_increment,
	user_id int not null,
	roles_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.user_roles
ADD CONSTRAINT FK_users
FOREIGN KEY (user_id) REFERENCES user(id)

ALTER TABLE learn_database.user_roles
ADD CONSTRAINT FK_roles
FOREIGN KEY (roles_id) REFERENCES roles(id)

create table learn_database.permission(
	id int auto_increment,
	name varchar(50) not null,
	created_at timestamp not null,
	updated_at timestamp not null,
    primary key(id)
)

create table learn_database.user_permission(
	id int auto_increment,
	user_id int not null,
	roles_id int not null,
	permission_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.user_permission
ADD CONSTRAINT FK_userss
FOREIGN KEY (user_id) REFERENCES user(id)

ALTER TABLE learn_database.user_permission
ADD CONSTRAINT FK_rolesss
FOREIGN KEY (roles_id) REFERENCES roles(id)

create table learn_database.product_img(
	id int auto_increment,
	img_path text not null,
	product_id int not null,
    primary key(id)
)
ALTER TABLE learn_database.product_img
ADD CONSTRAINT FK_productsss
FOREIGN KEY (product_id) REFERENCES product(id)

create table learn_database.slider(
	id int auto_increment,
	img_path text not null,
    primary key(id)
)

