CREATE DATABASE DemoApp
USE DemoApp
CREATE TABLE Countries(
   Id int PRIMARY KEY IDENTITY,
   Name nvarchar(50) NOT NULL UNIQUE,
   Area decimal(8,2) CHECK(Area>0)
)
CREATE TABLE Cities(
	Id int PRIMARY KEY IDENTITY,
	Name nvarchar(50) NOT NULL UNIQUE,
	Area decimal CHECK(Area>0),
	CountryId int FOREIGN KEY REFERENCES Countries(Id)
)
CREATE TABLE People(
Id int PRIMARY KEY IDENTITY,
   Name nvarchar(50),
   Surname nvarchar(50),
   PhoneNumber nvarchar(100) UNIQUE,
   Email nvarchar(100) UNIQUE NOT NULL,
   Gender nvarchar(50),
   HasCitizenship bit,
   CityId int FOREIGN KEY REFERENCES Cities(Id)
)
SELECT*FROM Countries
SELECT*FROM Cities
SELECT*FROM People

INSERT INTO Countries
VALUES('Azerbaycan',7534.2),
('Turkiye',3427.7),
('Rusiya',749753.3),
('Gurcustan',84382.5)

INSERT INTO Cities
VALUES('Baki', 4512.5 , 8),
('Sumqayit',4512.2, 8),
('Ankara',45.2, 9),
('London',112.5, null)

INSERT INTO People
VALUES
('Konul','Huseyinli','+9942342353','konul@gmail.com','FEMALE',1,4),
('Aysun','Huseyinli','+9947428454','aysun@gmail.com','FEMALE',1,4),
('Gunel','Mustafayeva','+9949988789','gunel@gmail.com','MALE',1,6),
('Ilqar','Huseynli','+994547876','ilqar@gmail.com','FEMALE',1,5)



SELECT p.Name 'PersonName', c.Name 'ContryName', ct.Name 'CityName' FROM Countries AS c
INNER JOIN Cities AS ct
ON c.Id=ct.CountryId
INNER JOIN People AS p
ON ct.Id=p.CityId


CREATE VIEW PersonCCityName
AS
SELECT p.Name 'PersonName', c.Name 'ContryName', ct.Name 'CityName' FROM Countries AS c
INNER JOIN Cities AS ct
ON c.Id=ct.CountryId
INNER JOIN People AS p
ON ct.Id=p.CityId
SELECT* FROM PersonCCityName


SELECT*FROM Countries
ORDER BY Area


SELECT*FROM Cities
ORDER BY Name DESC


SELECT COUNT(*) 'CountryCount' FROM Countries
WHERE Area>20000


SELECT MAX(Area) 'BiggestArea' FROM Countries
WHERE Name LIKE '%i%'


SELECT Name FROM Countries
UNION ALL
SELECT Name FROM Cities


SELECT ct.Name,COUNT(CityId) 'CitiesCount' FROM Cities AS ct
INNER JOIN People AS p
ON ct.Id=p.CityId
GROUP BY ct.Name 


SELECT ct.Name,COUNT(CityId) 'CityCount' FROM Cities AS ct
INNER JOIN People AS p
ON ct.Id=p.CityId
GROUP BY ct.Name
HAVING COUNT(CityId)>5


