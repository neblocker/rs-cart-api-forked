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

insert into carts (id, user_id, created_at, updated_at, status) values 
		('550e8400-e29b-41d4-a716-446655440000', '750e8400-e29a-11d4-b316-446655440e0d0', '2020-10-10', '2021-09-01', 'OPEN')
		('350e8400-e29b-71d4-a716-446655440000', '350e8400-e29a-11d4-b316-446655440e0d0', '2020-10-10', '2021-09-01', 'OPEN')
		('150e8400-e29b-51d4-a716-446655440000', '450e8400-e29a-11d4-b316-446655440e0d0', '2020-10-10', '2021-09-01', 'ORDERED')
		('650e8400-e29b-11d4-a716-446655440000', '550e8400-e29a-11d4-b316-446655440e0d0', '2020-10-10', '2021-09-01', 'OPEN')
		('350e8400-e29b-41d4-a716-446655440000', '450e8400-e29a-11d4-b316-446655440e0d0', '2020-10-10', '2021-09-01', 'OPEN')
		('050e8400-e29b-31d4-a716-446655440000', '850e8400-e29a-11d4-b316-446655440e0d0', '2020-10-10', '2021-09-01', 'ORDERED')


insert into cart_items (cart_id, product_id, count) values 
		('550e8400-e29b-41d4-a716-446655440000', '00das00f-cd9a-1fda-a3f6-4dd66f5s40edd', 1)