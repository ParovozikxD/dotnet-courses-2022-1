--Procedures for Award
USE FilmAwards

GO

------------------------------------
CREATE PROCEDURE AddAward
	@Title NVARCHAR(50),
	@Description NVARCHAR(250)
AS
INSERT INTO Awards(Title, [Description])
	VALUES(@Title, @Description)

-------------------------------------
CREATE PROCEDURE RemoveAward
	@AwardID INT
AS
DELETE FROM Awards WHERE 		
	ID = @AwardID

-------------------------------------
CREATE PROCEDURE GetAward
	@AwardID INT
AS
SELECT * FROM Awards
	WHERE ID = @AwardID

-------------------------------------
CREATE PROCEDURE OrderAwardByFieldASC
	@FieldIndex INT
AS
if @FieldIndex = 1
	SELECT * FROM Awards
	ORDER BY 1
if @FieldIndex = 2
	SELECT * FROM Awards
	ORDER BY 2
if @FieldIndex = 3
	SELECT * FROM Awards
	ORDER BY 3

-------------------------------------
CREATE PROCEDURE OrderAwardByFieldDESC
	@FieldIndex INT
AS
if @FieldIndex = 1
	SELECT * FROM Awards
	ORDER BY 1 DESC
if @FieldIndex = 2
	SELECT * FROM Awards
	ORDER BY 2 DESC
if @FieldIndex = 3
	SELECT * FROM Awards
	ORDER BY 3 DESC


-------------------------------------
CREATE PROCEDURE UpdateAward
	@AwardID INT,
	@Title NVARCHAR(50),
	@Description NVARCHAR(250)
AS
UPDATE Awards 
	SET Title = @Title,
		[Description] = @Title
	WHERE ID = @AwardID