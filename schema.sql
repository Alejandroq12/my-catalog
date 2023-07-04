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
  