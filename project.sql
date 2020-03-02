-- Creating umuzi database
CREATE DATABASE umuzi;

/*
Please note that I use the serial keyword
for auto_increment.
It is cleaner.

Assume the umuzi database has been selected 
*/

CREATE TABLE customers( 
    customer_id serial PRIMARY KEY, 
    first_name varchar(50),
    last_name varchar(50),
    gender varchar,
    address varchar(200),
    /*
        I used varchar 15 instead of int 10
        Since int 10 won't work for phone numbers
        like +448672445058
    */
    phone varchar(15),
    email varchar(100),
    city varchar(20),
    country varchar(50)

);

CREATE TABLE employees(
    employee_id serial PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    job_title varchar(20)
);

CREATE TABLE products(
    product_id serial PRIMARY KEY,
    product_name varchar(100),
    description varchar(300),
    buy_price decimal
);

CREATE TABLE orders(
    order_id serial PRIMARY KEY,
    product_id 
);