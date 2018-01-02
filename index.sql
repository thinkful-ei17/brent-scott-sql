CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name text,
  last_name text,
  email_address text NOT NULL,
  screen_name text NOT NULL UNIQUE
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
  (first_name, last_name, email_address, screen_name) VALUES 
    ('Brent', 'Guistwite', 'notshowingyoumyemail@gmail.com','sk8rboi'),
    ('Scott', 'Tribble', 'notshowingyoumyemail@gmail.com','sk8rGrl'),
    ('Tudor', 'Ilisoi', 'notshowingyoumyemail@gmail.com','tutor');

INSERT INTO posts
  (author, title, content) VALUES
    (2, 'Grapes are bad', 'or are they... sometimes grapes are good'),
    (1, 'Grapes are good', 'or are they... sometimes grapes are bad'),
    (3, 'Plums are the best', 'enough said.');

INSERT INTO comments 
(author, post, reply, comment) VALUES
  (3,1, null, 'first!'),
  (1,2, null, 'You are wrong'),
  (2,3, null, 'Plums taste like dirt'),
  (1,1,1,'second!');
