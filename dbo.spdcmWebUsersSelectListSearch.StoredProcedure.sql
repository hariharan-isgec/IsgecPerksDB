USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmWebUsersSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @CreatedBy NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,UserID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (UserID)
  SELECT [DCM_WebUsers].[UserID] FROM [DCM_WebUsers]
 WHERE  
      [DCM_WebUsers].[CreatedBy] = @CreatedBy
   AND ( 
         LOWER(ISNULL([DCM_WebUsers].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_WebUsers].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_WebUsers].[CreatedBy],'')) LIKE @KeyWord1
     OR STR(ISNULL([DCM_WebUsers].[TillDays], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'UserID' THEN [DCM_WebUsers].[UserID] END,
     CASE @orderBy WHEN 'UserID DESC' THEN [DCM_WebUsers].[UserID] END DESC,
     CASE @orderBy WHEN 'UserName' THEN [DCM_WebUsers].[UserName] END,
     CASE @orderBy WHEN 'UserName DESC' THEN [DCM_WebUsers].[UserName] END DESC,
     CASE @orderBy WHEN 'CreatedBy' THEN [DCM_WebUsers].[CreatedBy] END,
     CASE @orderBy WHEN 'CreatedBy DESC' THEN [DCM_WebUsers].[CreatedBy] END DESC,
     CASE @orderBy WHEN 'ActivateOn' THEN [DCM_WebUsers].[ActivateOn] END,
     CASE @orderBy WHEN 'ActivateOn DESC' THEN [DCM_WebUsers].[ActivateOn] END DESC,
     CASE @orderBy WHEN 'TillDays' THEN [DCM_WebUsers].[TillDays] END,
     CASE @orderBy WHEN 'TillDays DESC' THEN [DCM_WebUsers].[TillDays] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_WebUsers].[UserID],
		[DCM_WebUsers].[UserName],
		[DCM_WebUsers].[CreatedBy],
		[DCM_WebUsers].[ActivateOn],
		[DCM_WebUsers].[TillDays] 
  FROM [DCM_WebUsers] 
    	INNER JOIN #PageIndex
          ON [DCM_WebUsers].[UserID] = #PageIndex.UserID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
