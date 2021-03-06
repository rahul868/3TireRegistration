USE [User]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 08/03/2016 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]
	@FirstName Varchar(20),
	@LastName Varchar(20),
	@Gender int,
	@Email varchar(50),
	@Password varchar(16),
	@CreatedDate datetime = NULL
AS
BEGIN
	IF (@CreatedDate = NULL)
	BEGIN
		Select @CreatedDate = Getdate()
	END

	IF EXISTS(SELECT * FROM UserDetail WHERE Email=@Email)
	BEGIN
		Select -1 as UserId --UserName Availlable
	END
	ELSE
	BEGIN
		INSERT INTO UserDetail(FirstName,LastName,Gender,Email,Password,CreatedDate)
		VALUES(@FirstName,@LastName,@Gender,@Email,@Password,@CreatedDate)
		
		Select SCOPE_IDENTITY()
	END
END
GO
