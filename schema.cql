CREATE KEYSPACE travis;

USE travis;

CREATE TABLE users (
  first varchar,
  last varchar,
  age varchar,
);

INSERT INTO users (first, last, age)
  VALUES ('Jane', 'Doe', '84');

SELECT * FROM users WHERE first = 'Jane';
