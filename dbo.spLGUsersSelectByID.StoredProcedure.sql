USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLGUsersSelectByID]
  @UserName NVarChar(20)
  AS
  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName] 
  FROM [aspnet_Users] 
  WHERE
  [aspnet_Users].[UserName] = @UserName
GO
