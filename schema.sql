CREATE TABLE garage_sale (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR (400) NOT NULL,
  event_name VARCHAR (400) NOT NULL,
  address_line_1 VARCHAR (400)NOT NULL,
  address_line_2 VARCHAR (400) NOT NULL,
  postcode INTEGER NOT NULL,
  city VARCHAR (400) NOT NULL,
  sale_time TIME(4) NOT NULL,
  sale_date DATE NOT NULL,
  user_id INTEGER,
  category_id INTEGER
  );

CREATE TABLE category (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR (400)
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR (400) NOT NULL,
  password_digest VARCHAR (400)
);


CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  body TEXT,
  garage_sale_id INTEGER
)
