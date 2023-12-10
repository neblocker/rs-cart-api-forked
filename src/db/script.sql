create table carts(
		id uuid not null default uuid_generate_v4() primary key,
		user_id uuid not null,
		created_at date not null,
		updated_at date not null,
		status varchar(10) check (status in ('OPEN', 'ORDERED'))
)

create extension if not exists "uuid-ossp";

create table cart_items(
		product_id uuid,
		count integer
)

alter table cartItems add column cart_id uuid references carts(id)


insert into carts(id, user_id, created_at, updated_at, status) 
values('550e8400-e29b-41d4-a716-446655440000', '11e4b496-eca5-4029-828a-30c7604a10ac', '2020-10-10', '2021-09-01', 'OPEN')
	  ('d4378a3d-d62b-4232-bc44-0e5a0d4aded5', '4969a6a0-17e8-444d-9a10-93acd82258f7', '2020-10-10', '2021-09-01', 'OPEN')

insert into cart_items (cart_id, product_id, count) values 
		('550e8400-e29b-41d4-a716-446655440000', '00das00f-cd9a-1fda-a3f6-4dd66f5s40edd', 1)