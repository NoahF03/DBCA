drop table if exists sale;
drop table if exists kennel;
drop table if exists product;
drop table if exists customer;
drop table if exists employee;
drop table if exists pet;
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

-- Insert data

-- Populate the customer table
INSERT INTO customer (firstname, lastname, phone, email, address) VALUES
('Noah', 'Fahy', '123-456-7890', 'noahfahy@example.com', '123 Street'),
('Pierce', 'Mooney', '234-567-8901', 'piercemooney@example.com', '456 Avenue'),
('Eoghan', 'Noonan', '345-678-9012', 'Eoghannoonan@example.com', '789 Road'),
('Susan', 'Adams', '456-789-0123', 'susanadams@example.com', '101 Drive');

-- Populate the employee table
INSERT INTO employee (firstname, lastname, phone, email, jobtitle, hiredate, salary) VALUES
('Padzer', 'Doherty', '456-789-0123', 'Padzer@example.com', 'Manager', '2023-01-15', 55000),
('Derry', 'Davis', '567-890-1234', 'Derrydavis@example.com', 'Sales Associate', '2022-07-20', 32000),
('Diana', 'Miller', '678-901-2345', 'dianamiller@example.com', 'Technician', '2021-10-11', 42000),
('Edward', 'Thomas', '789-012-3456', 'edwardthomas@example.com', 'Veterinarian', '2020-03-15', 60000);

-- Populate the pet table
INSERT INTO pet (name, species, breed, dob, gender, price, availablestatus) VALUES
('Buddy', 'Dog', 'Golden Retriever', '2020-05-11', 'Male', 800, 'Available'),
('Whiskers', 'Cat', 'Siamese', '2019-08-21', 'Female', 300, 'Not Available'),
('Chirpy', 'Bird', 'Parakeet', '2021-02-18', 'Male', 50, 'Available'),
('Shadow', 'Dog', 'Husky', '2020-12-25', 'Female', 900, 'Available');

-- Populate the kennel table
INSERT INTO kennel (available, pet_petid, employee_employeeid) VALUES
('Yes', 1, 1),
('No', 2, 2),
('Yes', 3, 3),
('No', 4, 4);

-- Populate the supplier table
INSERT INTO supplier (suppliername, phone, email, address) VALUES
('Pet Supply Co.', '789-012-3456', 'contact@petsupply.com', '1010 Pet Street'),
('Animal Essentials', '890-123-4567', 'support@animalessentials.com', '2020 Animal Ave'),
('Pet World', '901-234-5678', 'info@petworld.com', '3030 Critter Lane'),
('Critter Supplies', '012-345-6789', 'info@crittersupplies.com', '4040 Pet Plaza');

-- Populate the product table
INSERT INTO product (productname, category, price, quantityinstock, supplier_supplierid) VALUES
('Dog Food', 'Food', 25.99, 100, 1),
('Cat Toy', 'Toys', 5.99, 50, 2),
('Bird Cage', 'Accessories', 45.00, 10, 3),
('Pet Shampoo', 'Hygiene', 12.50, 30, 4);

-- Populate the sale table
INSERT INTO sale (saledate, saletotal, customer_customerid, employee_employeeid, pet_petid, product_productid) VALUES
('2024-10-01', 875.99, 1, 1, 1, 1),
('2024-10-02', 305.99, 2, 2, 2, 2),
('2024-10-03', 55.00, 3, 3, 3, 3),
('2024-10-04', 95.00, 4, 4, 4, 4);

COMMIT;

