
USE ROLE movies_reader;

USE DATABASE movies;

USE SCHEMA staging;

SHOW TABLES;

SELECT * FROM netflix LIMIT 10;


SELECT title, genre, imdb_score FROM netflix WHERE imdb_score >= 7 ORDER BY imdb_score DESC;