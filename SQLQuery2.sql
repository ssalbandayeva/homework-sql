CREATE DATABASE CinemaDb

USE CinemaDb

CREATE TABLE Genres(
Id int primary key identity,
Name nvarchar(30) NOT NULL
)


CREATE TABLE Movies(
Id int primary key identity,
Name nvarchar(50) NOT NULL,
Duration decimal NOT NULL	
)


CREATE TABLE MovieGenres(
Id int primary key identity,
MovieId int foreign key references Movies(Id),
GenreId int foreign key references Genres(Id)
)


CREATE TABLE Actors(
Id int primary key identity,
Name nvarchar(100) NOT NULL
)

CREATE TABLE MovieActors(
Id int primary key identity,
MovieId int foreign key references Movies(Id),
ActorId int foreign key references Actors(Id)
)


CREATE TABLE Halls(
Id int primary key identity,
Name nvarchar(50) NOT NULL	
)

CREATE TABLE Sessions(
Id int primary key identity,
StartDate time NOT NULL,
EndDate time NOT NULL,
HallId int foreign key references Halls(Id),
MovieId int foreign key references Movies(Id)
)

CREATE TABLE Seats(
Id int primary key identity,
Row int NOT NULL,
Seat int NOT NULL,
HallId int foreign key references Halls(Id)
)

CREATE TABLE Customers(
Id int primary key identity,
Name nvarchar(100) NOT NULL 
)

CREATE TABLE Tickets(
Id int primary key identity,
SessionId int foreign key references Sessions(Id),
CustomerId int foreign key references Customers(Id),
Price decimal(18,2) NOT NULL,
SeatId int foreign key references Seats(Id)
)


SELECT * FROM Tickets
JOIN Customers
ON Customers.Id=Tickets.CustomerId
JOIN Seats
ON Seats.Id=Tickets.SeatId
JOIN Sessions
ON Sessions.Id=Tickets.SessionId
JOIN Movies
ON Movies.Id=Sessions.MovieId
JOIN Halls
ON Halls.Id=Sessions.HallId



SELECT Movies.Name 'Movies Name', Sessions.StartDate 'Movie Starts', Sessions.EndDate 'Movie Ends', Halls.Name 'Halls Name', Seats.Row, Seats.Seat, Customers.Name 'Customers Name', Tickets.Price FROM Tickets
JOIN Customers
ON Customers.Id=Tickets.CustomerId
JOIN Seats
ON Seats.Id=Tickets.SeatId
JOIN Sessions
ON Sessions.Id=Tickets.SessionId
JOIN Movies
ON Movies.Id=Sessions.MovieId
JOIN Halls
ON Halls.Id=Sessions.HallId



CREATE VIEW TicketReport
AS
SELECT Movies.Name 'Movies Name', Sessions.StartDate 'Movie Starts', Sessions.EndDate 'Movie Ends', Halls.Name 'Halls Name', Seats.Row, Seats.Seat, Customers.Name 'Customers Name', Tickets.Price FROM Tickets
JOIN Customers
ON Customers.Id=Tickets.CustomerId
JOIN Seats
ON Seats.Id=Tickets.SeatId
JOIN Sessions
ON Sessions.Id=Tickets.SessionId
JOIN Movies
ON Movies.Id=Sessions.MovieId
JOIN Halls
ON Halls.Id=Sessions.HallId


SELECT * FROM TicketReport

