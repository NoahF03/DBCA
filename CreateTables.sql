drop table if exists customer;
drop table if exists employee;
drop table if exists kennel;
drop table if exists pet;
drop table if exists product;
drop table if exists sale;
drop table if exists supplier;



CREATE TABLE customer (
    customerid SERIAL PRIMARY KEY,
    firstname  VARCHAR(50),
    lastname   VARCHAR(50),
    phone      VARCHAR(15),
    email      VARCHAR(100),
    address    VARCHAR(200)
);

CREATE TABLE employee (
    employeeid SERIAL PRIMARY KEY,
    firstname  VARCHAR(50),
    lastname   VARCHAR(50),
    phone      VARCHAR(15),
    email      VARCHAR(100),
    jobtitle   VARCHAR(50),
    hiredate   DATE,
    salary     NUMERIC(10, 2)
);

CREATE TABLE pet (
    petid SERIAL PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),
    price NUMERIC(10, 2),
    availablestatus VARCHAR(20)
);

CREATE TABLE kennel (
    kennelid SERIAL PRIMARY KEY,
    available VARCHAR(20),
    pet_petid INTEGER NOT NULL,
    employee_employeeid INTEGER NOT NULL,
    FOREIGN KEY (employee_employeeid) REFERENCES employee(employeeid),
    FOREIGN KEY (pet_petid) REFERENCES pet(petid)
);

CREATE TABLE supplier (
    supplierid SERIAL PRIMARY KEY,
    suppliername VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);

CREATE TABLE product (
    productid SERIAL PRIMARY KEY,
    productname VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantityinstock INTEGER,
    supplier_supplierid INTEGER NOT NULL,
    FOREIGN KEY (supplier_supplierid) REFERENCES supplier(supplierid)
);

CREATE TABLE sale (
    saleid SERIAL PRIMARY KEY,
    saledate DATE,
    saletotal NUMERIC(10, 2),
    customer_customerid INTEGER NOT NULL,
    employee_employeeid INTEGER NOT NULL,
    pet_petid INTEGER NOT NULL,
    product_productid INTEGER NOT NULL,
    FOREIGN KEY (customer_customerid) REFERENCES customer(customerid),
    FOREIGN KEY (employee_employeeid) REFERENCES employee(employeeid),
    FOREIGN KEY (pet_petid) REFERENCES pet(petid),
    FOREIGN KEY (product_productid) REFERENCES product(productid)
);


