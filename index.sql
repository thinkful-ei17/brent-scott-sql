CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name text,
  last_name text,
  email_address text NOT NULL,
  screen_name text NOT NULL
);

CREATE TABLE posts(
  id serial PRIMARY KEY,
  author integer NOT NULL REFERENCES users,
  title text NOT NULL,
  content text NOT NULL,
  published TIMESTAMP WITH TIME ZONE NOT NULL default now()
);

CREATE TABLE comments(
  id serial PRIMARY KEY,
  author integer NOT NULL REFERENCES users,
  post integer NOT NULL REFERENCES posts,
  reply integer REFERENCES comments,
  comment text NOT NULL
  
);

CREATE TABLE tags(
  id serial PRIMARY KEY,
  category text NOT NULL
);

CREATE TABLE post_tags (
  post_id integer NOT NULL REFERENCES posts,
  tag_id integer NOT NULL REFERENCES tags
);


INSERT INTO users 
  (first_name,last_name,email_address,screen_name) VALUES 
    ("Brent", "Guistwite", "notshowingyoumyemail@gmail.com","sk8rboi"),
    ("Scott", "Tribble", "notshowingyoumyemail@gmail.com","sk8rboi"),;
    ("Tudor", "Illisoi", "notshowingyoumyemail@gmail.com","sk8rboi"),