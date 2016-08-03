USE [User]
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 08/03/2016 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUser]
      @Email NVARCHAR(50)
AS
BEGIN
	IF EXISTS(SELECT * FROM UserDetail WHERE Email=@Email)
	BEGIN
		Select UserId from UserDetail where Email=@Email --UserName Availlable
	END
	ELSE
	BEGIN
		Select -1 as UserId
	END
END
GO
