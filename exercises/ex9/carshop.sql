DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    ss_num INTEGER NOT NULL,
    name TEXT,
    address TEXT,
    CONSTRAINT employee_pkey
    PRIMARY KEY (ss_num)
);

DROP TABLE IF EXISTS repair_job;
CREATE TABLE repair_job (
    id INTEGER NOT NULL,
    description TEXT, 
    CONSTRAINT repair_job_pkey
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS car;
CREATE TABLE car (
    license VARCHAR(10) NOT NULL,
    model TEXT,
    CONSTRAINT car_pkey
    PRIMARY KEY (license)
);

DROP TABLE IF EXISTS replaces;
CREATE TABLE replaces (
    replacement_id INTEGER NOT NULL,
    replacee_id INTEGER NOT NULL,
    CONSTRAINT replaces_pkey
    PRIMARY KEY (replacement_id, replacee_id),
    CONSTRAINT replacement_employee_fkey
    FOREIGN KEY (replacement_id)
    REFERENCES employee (ss_num),
    CONSTRAINT replacee_employee_fkey
    FOREIGN KEY (replacee_id)
    REFERENCES employee (ss_num)
);

DROP TABLE IF EXISTS does;
CREATE TABLE does (
    employee_id INTEGER NOT NULL,
    repair_job_id INTEGER NOT NULL,
    CONSTRAINT does_pkey
    PRIMARY KEY (employee_id, repair_job_id),
    CONSTRAINT employee_fkey
    FOREIGN KEY (employee_id)
    REFERENCES employee (ss_num),
    CONSTRAINT repair_job_fkey
    FOREIGN KEY (repair_job_id)
    REFERENCES repair_job (id)
);

DROP TABLE IF EXISTS repairs;
CREATE TABLE repairs ( 
    repair_job_id INTEGER NOT NULL,
    car_id TEXT  NOT NULL,
    CONSTRAINT repairs_pkey
    PRIMARY KEY (repair_job_id, car_id),
    CONSTRAINT repair_job_fkey
    FOREIGN KEY (repair_job_id)
    REFERENCES repair_job (id),
    CONSTRAINT car_fekey
    FOREIGN KEY (car_id)
    REFERENCES car (license)
);

DROP TABLE IF EXISTS sold;
CREATE TABLE sold (
    employee_id INTEGER NOT NULL,
    car_id TEXT NOT NULL,
    price MONEY,
    date TEXT,
    CONSTRAINT sold_pkey
    PRIMARY KEY (employee_id, car_id),
    CONSTRAINT sold_employee_fkey
    FOREIGN KEY (employee_id)
    REFERENCES emoloyee (ss_num),
    CONSTRAINT sold_car_fkey
    FOREIGN KEY (car_id)
    REFERENCES car (license)
);

