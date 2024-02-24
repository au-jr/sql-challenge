# sql-challenge
## *Robertson, J*


### Getting started

PostgreSQL version 14 has been used for all SQL command coding. Find this version of PostgreSQL here:

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

---

### Summary of code

An Entity Relationship Diagram (ERD) was created to map primary and foreign key relationships between the different databases:

!['ERD'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/ERD_image.png)

Tables were then created using the ERD as a guide. The tables can be created using the following commands.

    Departments:

!['table_departments'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/table_departments.png)

    Employees:

!['table_employees'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/table_employees.png)

    Position Titles:

!['table_title'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/table_titles.png)

    Employee Departments:

!['tables_dept_emp'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/tables_dept_emp.png)

    Department Managers:

!['tables_dept_manager'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/tables_dept_manager.png)

    Employee Salaries:

!['tables_salaries'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/tables_salaries.png)

#### The tables are populated by importing the following csv files via the following method:

#### 1.
Right-click on the table you want to import the data to.

!['import_1'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/import_1.png)

#### 2.
Locate the csv path in the local system.

!['import_2'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/import_2.png)

#### 3.
Ensure the header option is as below so the program knows there's a title row in the csv file.

!['import_3'](https://github.com/au-jr/sql-challenge/blob/main/EmployeeSQL/code_snippets/import_3.png)


From here we begin to create queries and subqueries, slicing and joining tables together to retrieve the challenge question information.

The code for each exercise is below:

Activity 1
    
    CREATE VIEW data_analysis_1 AS
	select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	from employees as e
		inner join salaries as s
		on e.emp_no = s.emp_no
	order by emp_no;


Activity 2

    CREATE VIEW data_analysis_2 AS
	select e.first_name, e.last_name, e.hire_date
	from employees as e
	where hire_date like '%1986';

Activity 3

    CREATE VIEW data_analysis_3 AS
	select e.emp_no, e.first_name, e.last_name, dm.dept_no, dep.dept_name
	from employees as e 
		inner join dept_manager as dm
		on e.emp_no = dm.emp_no
			inner join departments as dep
			on dm.dept_no = dep.dept_no
	order by emp_no;

Activity 4

    CREATE VIEW data_analysis_4 AS
	select e.emp_no, e.first_name, e.last_name, dep.dept_no, depts.dept_name
	from employees as e 
		inner join dept_emp as dep
		on e.emp_no = dep.emp_no
			inner join departments as depts
			on dep.dept_no = depts.dept_no
	order by emp_no;

Activity 5

    CREATE VIEW data_analysis_5 AS
	select e.first_name, e.last_name, e.sex
	from employees as e 
	where 
	first_name = 'Hercules' AND
	last_name like 'B%'
	order by last_name;

Activity 6

    CREATE VIEW data_analysis_6 AS
	select e.emp_no, e.first_name, e.last_name, depts.dept_name
	from employees as e 
		inner join dept_emp as dep
		on e.emp_no = dep.emp_no
			inner join departments as depts
			on dep.dept_no = depts.dept_no
	where dept_name = 'Sales'
	order by emp_no;

Activity 7

    CREATE VIEW data_analysis_7 AS
	select e.emp_no, e.first_name , e.last_name, depts.dept_name
	from employees as e 
		inner join dept_emp as dep
		on e.emp_no = dep.emp_no
			inner join departments as depts
			on dep.dept_no = depts.dept_no
	where 
	dept_name = 'Sales' OR
	dept_name = 'Development'
	order by emp_no;

Activity 8

    CREATE VIEW data_analysis_8 AS
	select e.last_name as Surname, count(e.last_name) as Counts
	from employees as e
	group by e.last_name
	order by Counts desc;
--- 

### References 
1. Ltd, D. T. (n.d.). QuickDBD. QuickDatabaseDiagrams. Accessed February 24, 2024, from https://app.quickdatabasediagrams.com/#/d/t13h4q