-- Fact Table: hr_fact
CREATE TABLE hr_fact (
  fact_id INT PRIMARY KEY,           -- fact_id
  emp_id INT,                        -- employee_id
  job_id INT,                        -- job_id
  department_id INT,                 -- department_id
  salary DECIMAL(10, 2),             -- salary
  review_date DATE,                  -- review_date
  rating INT,                        -- performance_rating (1 to 5)
  attendance_date DATE,              -- attendance_date
  attendance_status VARCHAR(20),     -- attendance_status (e.g., Present, Absent, Leave)
  FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
  FOREIGN KEY (job_id) REFERENCES job(job_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Dimension Table: employee
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,            -- employee_id
  first_name VARCHAR(50),            -- first_name
  last_name VARCHAR(50),             -- last_name
  email VARCHAR(100),                -- email
  phone_number VARCHAR(15),          -- phone_number
  hire_date DATE                     -- hire_date
);

-- Dimension Table: department
CREATE TABLE department (
  department_id INT PRIMARY KEY,     -- department_id
  department_name VARCHAR(100),      -- department_name
  manager_id INT,                    -- manager_id
  FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);

-- Dimension Table: job
CREATE TABLE job (
  job_id INT PRIMARY KEY,            -- job_id
  job_title VARCHAR(100),            -- job_title
  min_salary DECIMAL(10, 2),         -- min_salary
  max_salary DECIMAL(10, 2)          -- max_salary
);