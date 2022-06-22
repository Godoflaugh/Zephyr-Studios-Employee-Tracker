DROP DATABASE IF EXISTS company;

CREATE DATABASE company;
 
USE company;
CREATE TABLE department(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL
);

CREATE TABLE role (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(30) NOT NULL,
salary DECIMAL(10,4) NOT NULL,
department_id INT NOT NULL,
FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee (
id INT auto_increment primary KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
role_id INT roleNOT NULL,
FOREIGN KEY(role_id) REFERENCES role(id),
manager_id INT NOT NULL,
foreign key(manager_id) references employee(id)
);
 
 