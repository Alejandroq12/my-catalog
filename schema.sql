CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    biography TEXT
  );
  
  CREATE TABLE genres (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
  );
  
  CREATE TABLE labels (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    color TEXT NOT NULL
  );
  
  CREATE TABLE items (
    id INTEGER PRIMARY KEY,
    publish_date TEXT NOT NULL,
    archived INTEGER DEFAULT 0,
    author_id INTEGER,
    label_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id)
  );
  
  CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    publisher TEXT NOT NULL,
    cover_state TEXT NOT NULL,
    item_id INTEGER,
    FOREIGN KEY (item_id) REFERENCES items (id)
  );
  