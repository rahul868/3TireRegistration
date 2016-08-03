USE [User]
GO
/****** Object:  StoredProcedure [dbo].[ResetPassword]    Script Date: 08/03/2016 21:08:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ResetPassword]
	@UserId varchar(50),
	@Password varchar(16)
AS
BEGIN
	Update UserDetail SET [Password] = @Password where UserId=@UserId
	
	Select SCOPE_IDENTITY()
END
GO
