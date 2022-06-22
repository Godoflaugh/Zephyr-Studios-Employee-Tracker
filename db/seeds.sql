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