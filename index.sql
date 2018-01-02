CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name text,
  last_name text,
  email_address text NOT NULL,
  screen_name text NOT NULL
)

CREATE TABLE posts(
  id serial PRIMARY KEY,
  author integer REFERENCES users ON DELETE CASCADE,
  title text,
  content text,
  published TIMESTAMP WITH TIME ZONE
  
)

CREATE TABLE comments(
  id serial PRIMARY KEY,
  post integer REFERENCES posts,
)

CREATE TABLE tags(
  id serial PRIMARY KEY,
  post integer REFERENCES posts,
)