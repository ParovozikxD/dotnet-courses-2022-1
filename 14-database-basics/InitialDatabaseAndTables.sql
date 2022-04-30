--Creating a Database
CREATE DATABASE FilmAwards
GO
USE FilmAwards

--Creating Table Users

CREATE TABLE Users
(
	ID INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	BithDate DATE CHECK (BithDate < CAST(GETDATE() AS DATE) AND (BithDate > CAST(DATEADD(year, -150, GETDATE()) AS DATE)))
);

--Creating Table Awards

CREATE TABLE Awards
(
	ID INT IDENTITY PRIMARY KEY,
	Title NVARCHAR(50) UNIQUE NOT NULL,
	[Description] NVARCHAR(250) NOT NULL,
);

GO

--Creating Table UserAwards

CREATE TABLE UserAwards
(
	UserID INT NOT NULL FOREIGN KEY REFERENCES Users(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	AwardID INT NOT NULL FOREIGN KEY REFERENCES Awards(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (UserID, AwardID)
)
