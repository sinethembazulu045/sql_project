-- Creating umuzi database
CREATE DATABASE umuzi;

/*
Please note that I use the serial keyword
for auto_increment.
It is cleaner.

Assume the umuzi database has been selected 
*/

CREATE TABLE customers( 
    customer_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR,
    address VARCHAR(200),
    /*
        I used varchar 15 instead of int 10
        Since int 10 won't work for phone numbers
        like +448672445058
    */
    phone VARCHAR(15), 
    email VARCHAR(100),
    city VARCHAR(20),
    country VARCHAR(50)
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    job_title VARCHAR(20)
);

CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    description VARCHAR(300),
    buy_price DECIMAL
);

CREATE TABLE payments(
    customer_id INTEGER,
    payment_id SERIAL PRIMARY KEY,
    payment_date DATE,
    amount DECIMAL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

/* 
    create enum values for status 
    since status can only take two values
    Not shipped or Shipped
*/
CREATE TYPE status
AS ENUM (
    'Shipped',
    'Not shipped'
);
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    product_id INTEGER,
    payment_id INTEGER,
    fullfilled_by_employee_id INTEGER,
    date_required DATE,
    date_shipped DATE,
    status STATUS,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id),
    FOREIGN KEY (fullfilled_by_employee_id) REFERENCES employees(employee_id)
);

INSERT INTO customers(first_name, last_name, gender, address, phone, email, city, country) 
VALUES(
        'John', 
        'Hibert', 
        'Male', 
        '284 chaucer st',
        '084789657',
        'john@gmail.com',
        'Johannesburg',
        'South Africa'
     ),
    (
        'Thando', 
        'Sithole', 
        'Female', 
        '240 Sect 1',
        '0794445584',
        'thando@gmail.com',
        'Cape Town',
        'South Africa'
    ),
    (
        'Leon', 
        'Glen', 
        'Male', 
        '81 Everton Rd,Gillits',
        '0820832830',
        'Leon@gmail.com',
        'Durban',
        'South Africa'
    ),
    (
        'Charl', 
        'Muller', 
        'Male', 
        '290A Dorset Ecke',
        '+44856872553',
        'Charl.muller@yahoo.com',
        'Berlin',
        'Germany'
    ),
    (
        'Julia', 
        'Stein', 
        'Female', 
        '2 Wernerring',
        '+448672445058',
        'Js234@yahoo.com',
        'Frankfurt',
        'Germany'
    );

INSERT INTO employees(
        first_name, 
        last_name,
        email,
        job_title
    ) 
    VALUES (
        'Kani',
        'Matthew',
        'mat@gmail.com',
        'Manager'
    ),
    (
        'Lesly',
        'Cronje',
        'LesC@gmail.com',
        'Clerk'
    ),
    (
        'Gideon',
        'Maduku',
        'm@gmail.com',
        'Accountant'
    );

INSERT INTO payments (
        customer_id,
        payment_date,
        amount,
    )
    VALUES (
        1,
        '01-09-2018',
        150.75
    ),
    (
        5,
        '03-09-2018',
        150.75
    ),
    (
        4,
        '03-09-2018',
        700.60
    );

INSERT INTO products(
        product_name,
        description,
        buy_price
    )
    VALUES (
        'Harley Davidson Chopper',
        'This replica features working kickstand, 
        front suspension, gear-shift lever',
        150.75
    ),
    (
        'Classic Car',
        'Turnable front wheels, steering function',
        550.75
    ),
    (
        'Sports Car',
        'Turnable front wheels, steering function',
        700.60
    );

INSERT INTO orders(
        product_id,
        payment_id,
        fullfilled_by_employee_id,
        date_required,
        date_shipped,
        status
    ) 
    VALUES (
        1,
        1,
        2,
        '05-09-2018',
        DEFAULT,
        'Not shipped'
    ),
    (
        1,
        2,
        2,
        '04-09-2018',
        '03-09-2018',
        'Shipped'
    ),
    (
        3,
        3,
        3,
        '06-09-2018',
        DEFAULT,
        'Not shipped'
    );