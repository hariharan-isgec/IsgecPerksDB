USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmUsersSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName],
		[aspnet_Users].[ExtnNo],
		[aspnet_Users].[MobileNo],
		[aspnet_Users].[EMailID] 
  FROM [aspnet_Users] 
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC,
     CASE @orderBy WHEN 'ExtnNo' THEN [aspnet_Users].[ExtnNo] END,
     CASE @orderBy WHEN 'ExtnNo DESC' THEN [aspnet_Users].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'MobileNo' THEN [aspnet_Users].[MobileNo] END,
     CASE @orderBy WHEN 'MobileNo DESC' THEN [aspnet_Users].[MobileNo] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [aspnet_Users].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [aspnet_Users].[EMailID] END DESC 
  SET @RecordCount = @@RowCount
GO
