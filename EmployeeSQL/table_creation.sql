create table departments(
	dept_no varchar(5) primary key,
	dept_name varchar(40) NOT NULL
);

create table titles(
	title_id  varchar(7) primary key,
	title varchar(40) NOT NULL
);

create table employees(
	emp_no int primary key,
	emp_title_id varchar(7),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date varchar(10) NOT NULL,
	first_name varchar(40) NOT NULL,
	last_name varchar(40) NOT NULL,
	sex varchar(1) NOT NULL,
	hire_date varchar(10) NOT NULL
);

create table dept_manager(
	dept_no varchar(5),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)	
);

create table dept_emp(
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no varchar(5),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

create table salaries(
	emp_no int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary int NOT NULL
);