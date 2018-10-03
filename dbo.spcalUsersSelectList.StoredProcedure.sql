USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcalUsersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName],
		[aspnet_Users].[LocationID],
		[aspnet_Users].[ExtnNo],
		[aspnet_Users].[MobileNo],
		[aspnet_Users].[EMailID],
		[aspnet_Users].[NetworkIP],
		[AST_Locations1].[LocationID] AS AST_Locations1_LocationID,
		[AST_Locations1].[Descriptions] AS AST_Locations1_Descriptions 
  FROM [aspnet_Users] 
  LEFT OUTER JOIN [AST_Locations] AS [AST_Locations1]
    ON [aspnet_Users].[LocationID] = [AST_Locations1].[LocationID]
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @orderBy WHEN 'LocationID' THEN [aspnet_Users].[LocationID] END,
     CASE @orderBy WHEN 'LocationID DESC' THEN [aspnet_Users].[LocationID] END DESC,
     CASE @orderBy WHEN 'ExtnNo' THEN [aspnet_Users].[ExtnNo] END,
     CASE @orderBy WHEN 'ExtnNo DESC' THEN [aspnet_Users].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'MobileNo' THEN [aspnet_Users].[MobileNo] END,
     CASE @orderBy WHEN 'MobileNo DESC' THEN [aspnet_Users].[MobileNo] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC,
     CASE @orderBy WHEN 'AST_Locations1_LocationID' THEN [AST_Locations1].[LocationID] END,
     CASE @orderBy WHEN 'AST_Locations1_LocationID DESC' THEN [AST_Locations1].[LocationID] END DESC,
     CASE @orderBy WHEN 'AST_Locations1_Descriptions' THEN [AST_Locations1].[Descriptions] END,
     CASE @orderBy WHEN 'AST_Locations1_Descriptions DESC' THEN [AST_Locations1].[Descriptions] END DESC 
  SET @RecordCount = @@RowCount
GO
