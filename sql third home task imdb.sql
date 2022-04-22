create database IMDB
use  IMDB


---- sinifde diroctor bir dene olacaq demisdiz ona gore sekilde eledi lakin, taskın sonradan elave edilen  şərtləri bir neçə direktor elave etmeyi teleb etdi 

create table Movies
(
Id int primary key identity,
 Name NVARCHAR(50),
[Release date] NVARCHAR(50),
Minutes int,

)
ALTER TABLE Movies

ADD [Imdb point] float;


insert into movies
values('the dark knight','2008','152',9.1),('Endgame','2019',152,8.4),('Sonic','2020',99,6.5),('Logan','2017',122,8.1),('Tourist','2010',103,6)


create table Director(
Id int PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Surname NVARCHAR(50),
Height float,
Age int
)
alter table Director 
drop column Age, height;

INSERT INTO Director

VALUES  ('Christopher', 'Nolan'),
		('Joe', 'Russo'),
		('Jeff', 'Fowler'),
		('James', 'Mangold'),
		('Florian', 'Donnersmack')
		select* from director

CREATE TABLE MoviesDirectors
(
	ID INT PRIMARY KEY IDENTITY,
	MoviesID INT,
	DirectorsID INT
)
insert into Moviesdirectors
values (1,1),(2,2),(3,3),(4,4),(5,5)


create table Genres  (

Id int PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
)
INSERT INTO Genres
VALUES  ('Action'),
		('Fantastic'),
		('Drama'),
		('Comedy'),
		('Adventure'),
		('War'),
		('History')

create table actors (
Id int primary key identity,
Name NVARCHAR(50),
Surname NVARCHAR,
)

INSERT INTO Actors

Values ('Christian', 'Bale'), ('Heath', 'Ledger'), ('Robert', 'Downey'), ('Jim', 'Carrey'),('Huge', 'Jackman'), ('Johnny', 'Depp')

		select* from actors 

--EXEC sp_rename 'actors','Actors'

create table MovieGenres(
Id int PRIMARY KEY IDENTITY,
MovieId int FOREIGN KEY REFERENCES Movies (Id),
GenresId int FOREIGN KEY REFERENCES Genres(Id)

)

INSERT INTO MovieGenres
VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(3,2),(3,1),(4,2),(4,3),(4,6),(5,1),(5,5)

create table MovieActors
(
Id int PRIMARY KEY IDENTITY,
MovieId int FOREIGN KEY REFERENCES Movies(Id),
ActorId int Foreign Key REFERENCES MOVIES(Id)
)
select* from MovieActors

insert into MovieActors
values
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6)



select m.ID,
	   m.Name,
	   m.Imdb Point,
	   m.Minutes,
	   a.Name, a.Surname
from MovieActors ma
Join Movies m on m.ID = ma.MoviesId
Join Actors a on a.ID = ma.ActorsId

select m.ID,
	   m.Name,
	   m. [Imdb Point],
	   m.Minutes,
	   g.Name as Genre,
	   a.Name as [Actor Name], a.Surname as [Actor Surname],
	   d.Name as [Director Name], d.Surname as [Director Surname]

from Movies m
Join MovieGenres mg on mg.MoviesID = m.ID
Join Genres g on g.ID = mg.GenresID
--
Join MovieActors ma on ma.MoviesID = m.ID
Join Actors a on a.ID = ma.ActorsID
--
Join MovieDirectors md on md.MoviesID = m.ID
Join Directors d on d.ID = md.DirectorsID
where m.Point > 6
Order by m.Name

select m.ID,
	   m.Name,
	   m. [Imdb Point],
	   m.Minutes,
	   g.Name
from Movies m
Join MoviesGenres mg on mg.MoviesID = m.ID
Join Genres g on g.ID = mg.GenreID
where g.Name like '%a%'
Order by m.Name


select m.ID,
	   m.Name,
	   m. [Imdb Point],
	   m.Minutes,
	   g.Name as Genrre,
	   a.Name as [Actor Name], a.Surname as [Actor Surname],
	   d.Name as [Director Name], d.Surname as [Director Surname]
from Movies m
Join MoviesGenres mg on mg.MoviesID = m.ID
Join Genres g on g.ID = mg.GenreID
--
Join MoviesActors ma on ma.MoviesID = m.ID
Join Actors a on a.ID = ma.ActorsID
--
Join MoviesDirectors md on md.MoviesID = m.ID
Join Directors d on d.ID = md.DirectorsID

where (Select avg(Point) from Movies ) < Point
Order by m.Point desc
