-- Populate the customer table
INSERT INTO customer (firstname, lastname, phone, email, address) VALUES
('John', 'Doe', '123-456-7890', 'johndoe@example.com', '123 Maple Street'),
('Jane', 'Smith', '234-567-8901', 'janesmith@example.com', '456 Oak Avenue'),
('Bob', 'Johnson', '345-678-9012', 'bobjohnson@example.com', '789 Pine Road');

-- Populate the employee table
INSERT INTO employee (firstname, lastname, phone, email, jobtitle, hiredate, salary) VALUES
('Alice', 'Brown', '456-789-0123', 'alicebrown@example.com', 'Manager', '2023-01-15', 55000),
('Charlie', 'Davis', '567-890-1234', 'charliedavis@example.com', 'Sales Associate', '2022-07-20', 32000),
('Diana', 'Miller', '678-901-2345', 'dianamiller@example.com', 'Technician', '2021-10-11', 42000);

-- Populate the pet table
INSERT INTO pet (name, species, breed, dob, gender, price, availablestatus) VALUES
('Buddy', 'Dog', 'Golden Retriever', '2020-05-11', 'Male', 800, 'Available'),
('Whiskers', 'Cat', 'Siamese', '2019-08-21', 'Female', 300, 'Not Available'),
('Chirpy', 'Bird', 'Parakeet', '2021-02-18', 'Male', 50, 'Available');

-- Populate the kennel table
INSERT INTO kennel (available, pet_petid, employee_employeeid) VALUES
('Yes', 1, 1),
('No', 2, 2),
('Yes', 3, 3);

-- Populate the supplier table
INSERT INTO supplier (suppliername, phone, email, address) VALUES
('Pet Supply Co.', '789-012-3456', 'contact@petsupply.com', '1010 Pet Street'),
('Animal Essentials', '890-123-4567', 'support@animalessentials.com', '2020 Animal Ave'),
('Pet World', '901-234-5678', 'info@petworld.com', '3030 Critter Lane');

-- Populate the product table
INSERT INTO product (productname, category, price, quantityinstock, supplier_supplierid) VALUES
('Dog Food', 'Food', 25.99, 100, 1),
('Cat Toy', 'Toys', 5.99, 50, 2),
('Bird Cage', 'Accessories', 45.00, 10, 3);

-- Populate the sale table
INSERT INTO sale (saledate, saletotal, customer_customerid, employee_employeeid, pet_petid, product_productid) VALUES
('2024-10-01', 875.99, 1, 1, 1, 1),
('2024-10-02', 305.99, 2, 2, 2, 2),
('2024-10-03', 55.00, 3, 3, 3, 3);
