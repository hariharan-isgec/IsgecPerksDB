USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmUsersSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  UserName NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (UserName)
  SELECT [aspnet_Users].[UserName] FROM [aspnet_Users]
 WHERE  
   ( 
         LOWER(ISNULL([aspnet_Users].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users].[UserFullName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'UserName' THEN [aspnet_Users].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [aspnet_Users].[UserName] END DESC,
     CASE @orderBy WHEN 'UserFullName' THEN [aspnet_Users].[UserFullName] END,
     CASE @orderBy WHEN 'UserFullName DESC' THEN [aspnet_Users].[UserFullName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[aspnet_Users].[UserName],
		[aspnet_Users].[UserFullName] 
  FROM [aspnet_Users] 
    	INNER JOIN #PageIndex
          ON [aspnet_Users].[UserName] = #PageIndex.UserName
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
