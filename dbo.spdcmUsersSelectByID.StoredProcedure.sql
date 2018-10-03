USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmUsersSelectByID]
  @UserName NVarChar(20) 
  AS
  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName],
		[aspnet_Users].[ExtnNo],
		[aspnet_Users].[MobileNo],
		[aspnet_Users].[EMailID] 
  FROM [aspnet_Users] 
  WHERE
  [aspnet_Users].[UserName] = @UserName
GO
