create database IMDB
use  IMDB

create table Movies
(
Id int primary key identity,
 Name NVARCHAR(50),
[Release date] NVARCHAR(50),
Minutes int,
DirectorId int FOREIGN KEY REFERENCES Director(Id)

)
ALTER TABLE Movies

ADD [Imdb point] float;

create table Director(
Id int PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Surname NVARCHAR(50),
Height float,
Age int
)


create table Genres  (

Id int PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
)

create table actors (
Id int primary key identity,
Name NVARCHAR(50),
Surname NVARCHAR,
Height float,
Age int
)
--EXEC sp_rename 'actors','Actors'

create table MovieGenres(
Id int PRIMARY KEY IDENTITY,
MovieId int FOREIGN KEY REFERENCES Movies (Id),
GenresId int FOREIGN KEY REFERENCES Genres(Id)
)

create table MovieActors
(
Id int PRIMARY KEY IDENTITY,
MovieId int FOREIGN KEY REFERENCES Movies(Id),
ActorId int Foreign Key REFERENCES MOVIES(Id)
)

