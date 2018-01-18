#project database login_information

CREATE DATABASE
	artist_app_database_official;


CREATE TABLE users(
id SERIAL PRIMARY KEY,
username VARCHAR (300),
email VARCHAR(300),
password_digest TEXT
);


















# extra









CREATE TABLE dishes(
id SERIAL PRIMARY KEY,
name VARCHAR(300),
image_url VARCHAR(400)
);



INSERT INTO dishes (name, image_url) Values ('Goku', 'https://vignette.wikia.nocookie.net/dragonball/images/5/5b/Gokusteppingoutofaspaceship.jpg/revision/latest/scale-to-width-down/224?cb=20150325220848');

SELECT * FROM dishes WHERE Values = ('Goku', 'https://vignette.wikia.nocookie.net/dragonball/images/5/5b/Gokusteppingoutofaspaceship.jpg/revision/latest/scale-to-width-down/224?cb=20150325220848');



CREATE TABLE postbook(
id SERIAL PRIMARY KEY,
email VARCHAR(300),
password_digest TEXT
);





