// Task 2 — Employee System
// Create:
// Employee
// Then:
// * Manager
// * Developer
// Requirements
// * Use parameterized constructors
// * Use named constructors
// * Use redirect constructor
// * Use optional parameters
// Create functions:
// * calculateSalary()
// * displayEmployee()
// variable to count number of employees.
// ====================================

void main() {
  Manager manager = Manager("Ahmed", 1, 10000, bonus: 3000);

  Developer developer = Developer("Ali", 2, 8000, overtime: 1500);

  Employee trainee = Employee.intern();

  manager.displayEmployee();
  print("Salary: ${manager.calculateSalary()}");

  print("------------------");

  developer.displayEmployee();
  print("Salary: ${developer.calculateSalary()}");

  print("------------------");

  trainee.displayEmployee();

  print("------------------");
  print("Total Employees: ${Employee.employeeCount}");
}

class Employee {
  String name;
  int id;
  double salary;

  static int employeeCount = 0;
  Employee(this.name, this.id, this.salary) {
    employeeCount++;
  }

  Employee.intern() : name = "Intern", id = 0, salary = 3000 {
    employeeCount++;
  }

  Employee.defaultEmployee() : this("Unknown", -1, 0);

  double calculateSalary() {
    return salary;
  }

  void displayEmployee() {
    print("Name: $name");
    print("ID: $id");
    print("Salary: $salary");
  }
}

class Manager extends Employee {
  double bonus;

  Manager(String name, int id, double salary, {this.bonus = 0})
    : super(name, id, salary);

  @override
  double calculateSalary() {
    return salary + bonus;
  }
}

class Developer extends Employee {
  double overtime;

  Developer(String name, int id, double salary, {this.overtime = 0})
    : super(name, id, salary);

  @override
  double calculateSalary() {
    return salary + overtime;
  }
}
