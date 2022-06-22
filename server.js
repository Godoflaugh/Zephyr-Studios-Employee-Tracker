const express = require('express')
const inquirer = ('inquirer')
const mysql = require('mysql2')
const consoleTable = require('console.table')
// const { type } = require('os')
// //
// const { exitCode } = require('process')
// const { start } = require('repl')

const PORT = process.env.PORT || 3001
const app = express()

app.use(express.urlencoded({ extended: false }));
app.use(express.json());


const db = mysql.createConnection(
  {
    host: 'localhost',
    user: 'root',
    password: 'GurenLagann7!',
    database: 'company',
  },
  // console.log("Connected to the company database.")
)


const startProgram = () => {
  inquirer
    .prompt([
      {
        type: "list",
        name: "menu",
        message: "list",
        choices: [
          "View all departments",
          "View all Jobs",
          "View all Employee's",
          "Add a department",
          "Add a job",
          "Add an employee",
          "Update an employee",
          "Exit program",
        ],
      },
    ])
    .then(choice => {
      switch (choice.menu) {

        case "View all departments":
          viewDepartments()
          break

        case "View all Jobs":
          viewJobs()
          break

        case "View all Employee's":
          viewEmployee()
          break

        case "Add a department":
          addDepartment()
          break

        case "Add a job":
          addJob()
          break

        case "Add an employee":
          addEmployee()
          break

        case "Update an Employee":
          updateEmployee()
          break

        case "Exit Program":
          console.log("Thank you come again!")
          db.end()
          break
      }
    })
}

startProgram()

// Create functions for each use case from User Input

const viewDepartments = () => {
  db.query("SELECT * FROM department", function (err, res) {
    if (err) throw err
    console.table(res)
    startProgram()
  })
}

const viewJobs = () => {
  db.query("SELECT * FROM role", function (err, res) {
    if (err) throw err
    console.table(res)
    startProgram()
  })
}

// const viewEmployee = () => {
//   // const sql = "SELECT employee.id, CONCAT(employee.first_name, " ", employee.last_name) AS Full_Name, name AS Division, title AS Title, salary AS Salary, department_id, manager_id FROM((department JOIN role ON department.id = role.department_id) JOIN employee ON role.id = employee.role_id);"

//   db.query("SELECT employee.id, CONCAT(employee.first_name, " ", employee.last_name) AS Full_Name, name AS Division, title AS Title, salary AS Salary, department_id, manager_id FROM((department JOIN role ON department.id = role.department_id) JOIN employee ON role.id = employee.role_id);", function (err, res) {
//     if (err) throw err
//     console.table(res)
//     startProgram()
//   })
// }

const addDepartment = () => {
  inquirer.prompt([
    {
      name: "department",
      type: "input",
      message: "Name of department?"
    }
  ])
    .then(answer => {
      db.query("INSERT INTO department (name) VALUES (?)", [answer.department], function (err, res) {
        if (err) throw err
        console.log("Adding Department!")
        startProgram()
      })
    })
}

const addJob = () => {
  inquirer.prompt([
    {
      name: "jobs",
      type: "input",
      message: "What is the job name?",
    },
    {
      name: "salary",
      type: "input",
      message: "What is their salary?",
    },
    {
      name: "deptId",
      type: "input",
      message: "What is their department ID? 1-8",
    },
  ])
    .then(answer => {
      db.query("INSERT INTO role (title, salary, department_id) VALUES (?, ?, ?)", [answer.jobs, answer.salary, answer.deptId],
        function (err, res) {
          if (err) throw err
          console.table(res)
          startProgram()
        })
    })
}

const addEmployee = () => {
  inquirer.prompt([
    {
      name: "firstName",
      type: "input",
      message: "What is the employee's first name?",
    },
    {
      name: "lastName",
      type: "input",
      message: "What is the employee's last name?",
    },
    {
      name: "roleId",
      type: "input",
      message: "What is the employee's role ID? 001-008",
    },
    {
      name: "managerId",
      type: "input",
      message: "What is the manager's ID? 1-4",
    }
  ])
    .then(answer => {
      db.query("INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES (?, ?, ?, ?))", [answer.firstName, answer.lastName, answer.roleID, answer.managerId],
        function (err, res) {
          if (err) throw err
          console.table(res)
          startProgram()
        })
    })
}

const updateEmployee = () => {
  inquirer.prompt([
    {
      name: "id",
      type: "input",
      message: "Enter the employee's ID",
    },
    {
      name: "roleId",
      type: "input",
      message: "Enter the new role ID for the employee. 001-008",
    },
  ])
    .then(answer => {
      db.query("UPDATE employee SET role_id=? WHERE ID=?", [answer.roleID, answer.id],
        function (err, res) {
          if (err) throw err
          console.table(res)
          startProgram()
        }
      )
    })
}




db.connect((err) => {
  if (err) throw err
  console.log("Welcome to Zephyr Studio's Team!")
})



// Default response for any other request (Not Found)
app.use((req, res) => {
  res.status(404).end();
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
