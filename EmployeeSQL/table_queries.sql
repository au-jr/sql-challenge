-- Data Analysis 1

CREATE VIEW data_analysis_1 AS
	select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	from employees as e
		inner join salaries as s
		on e.emp_no = s.emp_no
	order by emp_no;

select * from data_analysis_1;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 2

CREATE VIEW data_analysis_2 AS
	select e.first_name, e.last_name, e.hire_date
	from employees as e
	where hire_date like '%1986';

select * from data_analysis_2;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 3

CREATE VIEW data_analysis_3 AS
	select e.emp_no, e.first_name, e.last_name, dm.dept_no, dep.dept_name
	from employees as e 
		inner join dept_manager as dm
		on e.emp_no = dm.emp_no
			inner join departments as dep
			on dm.dept_no = dep.dept_no
	order by emp_no;

select * from data_analysis_3;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 4

CREATE VIEW data_analysis_4 AS
	select e.emp_no, e.first_name, e.last_name, dep.dept_no, depts.dept_name
	from employees as e 
		inner join dept_emp as dep
		on e.emp_no = dep.emp_no
			inner join departments as depts
			on dep.dept_no = depts.dept_no
	order by emp_no;

select * from data_analysis_4;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 5
CREATE VIEW data_analysis_5 AS
	select e.first_name, e.last_name, e.sex
	from employees as e 
	where 
	first_name = 'Hercules' AND
	last_name like 'B%'
	order by last_name;

select * from data_analysis_5;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 6

CREATE VIEW data_analysis_6 AS
	select e.emp_no, e.first_name, e.last_name, depts.dept_name
	from employees as e 
		inner join dept_emp as dep
		on e.emp_no = dep.emp_no
			inner join departments as depts
			on dep.dept_no = depts.dept_no
	where dept_name = 'Sales'
	order by emp_no;

select * from data_analysis_6;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 7

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

select * from data_analysis_7;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Data Analysis 8

CREATE VIEW data_analysis_8 AS
	select e.last_name as Surname, count(e.last_name) as Counts
	from employees as e
	group by e.last_name
	order by Counts desc;

select * from data_analysis_8;