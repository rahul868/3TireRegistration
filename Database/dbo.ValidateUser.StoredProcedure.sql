USE [User]
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 08/03/2016 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateUser]
      @Email NVARCHAR(50),
      @Password NVARCHAR(20)
AS
BEGIN
	Declare @LastLoginDate datetime
	SET @LastLoginDate = GETDATE()
	
	IF EXISTS(SELECT * FROM UserDetail WHERE Email=@Email AND [Password] = @Password)
	BEGIN
		Select UserId from UserDetail where Email=@Email --UserName Availlable
		Update UserDetail set LastLoginDate = @LastLoginDate
	END
	ELSE
	BEGIN
		Select -1 as UserId
	END
END
GO
