CREATE TABLE area (
  id SERIAL PRIMARY KEY, name TEXT NOT NULL
);
CREATE TABLE employer (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL, 
  email TEXT NOT NULL UNIQUE, 
  area_id INTEGER REFERENCES area (id)
);
CREATE TABLE employee (
  id SERIAL PRIMARY KEY, 
  name TEXT NOT NULL, 
  email TEXT NOT NULL UNIQUE, 
  gender VARCHAR(1) NOT NULL, 
  area_id INTEGER REFERENCES area (id)
);
CREATE TABLE specialization (
  id SERIAL PRIMARY KEY, name TEXT NOT NULL
);
CREATE TABLE vacancy (
  id SERIAL PRIMARY KEY, 
  title TEXT NOT NULL, 
  description TEXT NOT NULL, 
  compensation_from INTEGER NOT NULL, 
  compensation_to INTEGER NOT NULL, 
  compensation_gross BOOLEAN NOT NULL, 
  created TIMESTAMP NOT NULL, 
  area_id INTEGER REFERENCES area (id), 
  specialization_id INTEGER REFERENCES specialization (id), 
  employer_id INTEGER REFERENCES employer (id)
);
CREATE TABLE resume (
  id SERIAL PRIMARY KEY, 
  description TEXT NOT NULL, 
  created TIMESTAMP NOT NULL, 
  salary INTEGER, 
  area_id INTEGER REFERENCES area (id), 
  specialization_id INTEGER REFERENCES specialization (id), 
  employee_id INTEGER REFERENCES employee (id)
);
CREATE TABLE negotiations_status (
  id SERIAL PRIMARY KEY, name TEXT NOT NULL
);
CREATE TABLE response (
  id SERIAL PRIMARY KEY, 
  created TIMESTAMP NOT NULL, 
  vacancy_id INTEGER REFERENCES vacancy (id), 
  employee_id INTEGER REFERENCES employee (id), 
  negotiations_status_id INTEGER REFERENCES negotiations_status (id)
);
