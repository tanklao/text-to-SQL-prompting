-- Fact Table: sales_fact
CREATE TABLE sales_fact (
  fact_id INT PRIMARY KEY,           -- fact_id
  oid INT,                           -- order_id
  cid INT,                           -- customer_id
  dt DATE,                           -- order_date
  amt DECIMAL(10, 2),                -- total_amount
  sp_id INT,                         -- salesperson_id (derived from employee_id)
  FOREIGN KEY (cid) REFERENCES cust(cid),
  FOREIGN KEY (sp_id) REFERENCES employee(emp_id)  -- Reference to employee table
);

-- Dimension Table: cust
CREATE TABLE cust (
  cid INT PRIMARY KEY,               -- customer_id
  fn VARCHAR(50),                    -- first_name
  ln VARCHAR(50),                    -- last_name
  em VARCHAR(100),                   -- email
  ct VARCHAR(50),                    -- city
  rg VARCHAR(50)                     -- region
);

-- Dimension Table: prod
CREATE TABLE prod (
  pid INT PRIMARY KEY,               -- product_id
  pn VARCHAR(100),                   -- product_name
  cat VARCHAR(50),                   -- category
  pr DECIMAL(10, 2)                  -- price
);

-- Dimension Table: ordr_item
CREATE TABLE ordr_item (
  oid INT,                           -- order_id
  pid INT,                           -- product_id
  qty INT,                           -- quantity
  pr DECIMAL(10, 2),                 -- unit_price
  FOREIGN KEY (oid) REFERENCES sales_fact(oid),
  FOREIGN KEY (pid) REFERENCES prod(pid)
);

-- Dimension Table: revw
CREATE TABLE revw (
  rid INT PRIMARY KEY,               -- review_id
  pid INT,                           -- product_id
  cid INT,                           -- customer_id
  rt INT,                            -- rating (1 to 5)
  cm TEXT,                           -- comment
  dt DATE,                           -- review_date
  FOREIGN KEY (pid) REFERENCES prod(pid),
  FOREIGN KEY (cid) REFERENCES cust(cid)
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