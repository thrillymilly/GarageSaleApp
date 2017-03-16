CREATE TABLE lost_pets (
  id SERIAL4 PRIMARY KEY,
  pet_name VARCHAR (400) NOT NULL,
  house_number INTEGER NOT NULL,
  street_name VARCHAR (400) NOT NULL,
  postcode INTEGER NOT NULL,
  city VARCHAR (400) NOT NULL,
  lost_date DATE NOT NULL,
  user_id INTEGER,
  category_id INTEGER,
  image_url TEXT
  );

CREATE TABLE category (
  id SERIAL4 PRIMARY KEY,
  breed VARCHAR (400)
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
