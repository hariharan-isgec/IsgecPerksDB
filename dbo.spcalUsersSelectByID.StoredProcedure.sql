USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalUsersSelectByID]
  @UserName NVarChar(20)
  AS
  SELECT
		[aspnet_Users].* ,
		[AST_Locations1].[LocationID] AS AST_Locations1_LocationID,
		[AST_Locations1].[Descriptions] AS AST_Locations1_Descriptions 
  FROM [aspnet_Users] 
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations1]
    ON [aspnet_Users].[LocationID] = [AST_Locations1].[LocationID]
  WHERE
  [aspnet_Users].[UserName] = @UserName
GO
