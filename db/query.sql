DROP DATABASE IF EXISTS company;

CREATE DATABASE company;
USE company;

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS employee;


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
role_id INT NOT NULL,
FOREIGN KEY(role_id) REFERENCES role(id),
manager_id INT,
foreign key(manager_id) references employee(id)
);
 
 
 
 INSERT INTO department(name)
	VAlUES("Art"),
		  ("Design"),
          ("SFX"),
          ("QA"),
          ("HR"),
          ("Narrative"),
          ("Systems"),
          ("Combat");
          
INSERT INTO role (title, salary, department_id)
	VALUES("Intern", 10000, 001),
    ("Associate", 20000, 001),
    ("UIX", 40000, 001),
    ("Producer", 50000, 001),
    ("Senior Producer", 70000, 001),
    ("Associate", 40000, 002),
    ("Producer", 65000, 002),
    ("Lighting Associate", 75000, 003),
    ("Lighting Producer", 85000, 003),
    ("Tester", 40000, 004),
    ("Senior Test Manager", 80000, 004),
	("SCRUM Master", 100000, 004),    
    ("HR Manager", 90000, 005),
    ("HR Associate", 50000, 005),
    ("Narrative-Story", 60000, 006),
    ("Narrative-Side", 60000, 006),
    ("Story Master", 90000, 006),
    ("Systems-Engineering", 120000, 007),
    ("Systems-Backend", 120000, 007),
    ("Systems-Frontend", 120000, 007),
    ("Combat-Melee-Designer", 80000, 008),
    ("Combat-Ranged-Designer", 80000, 008),
    ("Combat-Utils-Designer", 80000, 008);
    

INSERT INTO employee(first_name, last_name, role_id, manager_id)
	VALUES
    ("Kevin", "Lam", 17, NULL),
    ("Timmy", "Kid", 15, 1),
    ("Bob", "Builder", 16, 1),
    ("Alan", "Wake", 5, NULL),
    ("Sun", "Wukong", 4, 4);


SELECT * FROM employee;
SELECT * FROM role;
SELECT * FROM department;

SELECT employee.id, CONCAT(employee.first_name, " ", employee.last_name) AS Full_Name, name AS Division, title AS Title, salary AS Salary, department_id, manager_id
FROM ((department JOIN role ON department.id = role.department_id)
JOIN employee ON role.id = employee.role_id);