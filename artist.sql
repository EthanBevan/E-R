#project database login_information

CREATE DATABASE
	artist_app_database_official;


CREATE TABLE users(
id SERIAL PRIMARY KEY,
username VARCHAR (300),
email VARCHAR(300),
password_digest TEXT
);

#next

CREATE TABLE artists(
id SERIAL PRIMARY KEY,
nameofartist VARCHAR(300),
image_url VARCHAR(400),
bio VARCHAR(600)
FOREIGN KEY (user) REFERENCES users (id) ON DELETE RESTRICT 
);

CREATE TABLE events(
id SERIAL PRIMARY KEY,
tourevent VARCHAR (300),
address VARCHAR(300),
city VARCHAR(300),
dateofconcert VARCHAR(300),
timeofconcert  VARCHAR(300)
FOREIGN KEY (artist) REFERENCES artists (id) ON DELETE RESTRICT 
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





