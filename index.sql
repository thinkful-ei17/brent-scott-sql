CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name text,
  last_name text,
  email_address text NOT NULL,
  screen_name text NOT NULL
)

CREATE TABLE posts(
  id serial PRIMARY KEY,
  author integer REFERENCES users,
  title text NOT NULL,
  content text NOT NULL,
  published TIMESTAMP WITH TIME ZONE 
)

CREATE TABLE comments(
  id serial PRIMARY KEY,
  author integer REFERENCES users,
  post integer REFERENCES posts,
  comment text NOT NULL
)

CREATE TABLE tags(
  id serial PRIMARY KEY,
  category text NOT NULL,
)

CREATE TABLE post_tags (
  post_id integer REFERENCES posts,
  tag_id integer REFERENCES tags
)