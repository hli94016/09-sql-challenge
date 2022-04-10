-- "dept_no","dept_name"
CREATE TABLE departments (
    dept_no    VARCHAR(16) NOT NULL,
    dept_name  VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_no)
) ENGINE = InnoDB;

-- title_id,title
CREATE TABLE title (
    title_id VARCHAR(16) NOT NULL,
    title    VARCHAR(255) NOT NULL,
    PRIMARY KEY (title_id)
) ENGINE = InnoDB;

-- emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
CREATE TABLE employees (
    emp_no        BIGINT  NOT NULL,
    emp_title_id  VARCHAR(16) NOT NULL,
    birth_date    DATE NOT NULL,
    first_name    VARCHAR(255) NOT NULL,
    last_name     VARCHAR(255) NOT NULL,
    sex           VARCHAR(8) NOT NULL,
    hire_date     DATE NOT NULL,
    CONSTRAINT FK_employees_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES title(title_id),
    PRIMARY KEY (emp_no)
) ENGINE = InnoDB;

-- emp_no,salary
CREATE TABLE salaries (
    emp_no  BIGINT  NOT NULL,
    salary  BIGINT  NOT NULL,
    CONSTRAINT FK_salaries_employees_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (emp_no)
) ENGINE = InnoDB;

-- emp_no,dept_no
CREATE TABLE dept_emp (
    emp_no  BIGINT  NOT NULL,
    dept_no VARCHAR(16) NOT NULL,
    CONSTRAINT FK_dept_emp_employees_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    CONSTRAINT FK_dept_emp_departments_dept_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
) ENGINE = InnoDB;

-- dept_no,emp_no
CREATE TABLE dept_manager (
    dept_no VARCHAR(16) NOT NULL,
    emp_no  BIGINT  NOT NULL,
    CONSTRAINT FK_dept_manager_departments_no FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    CONSTRAINT FK_dept_manager_employee_emp_no FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
) ENGINE = InnoDB;
