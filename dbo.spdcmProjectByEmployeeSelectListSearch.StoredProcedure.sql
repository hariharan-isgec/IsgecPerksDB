USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spdcmProjectByEmployeeSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,RecordID Int NOT NULL
  )
  INSERT INTO #PageIndex (RecordID)
  SELECT [DCM_ProjectByEmployee].[RecordID] FROM [DCM_ProjectByEmployee]
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [DCM_ProjectByEmployee].[CardNo] = [aspnet_Users2].[UserName]
  INNER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_ProjectByEmployee].[ProjectID] = [DCM_Projects1].[ProjectID]
 WHERE  
   ( 
         STR(ISNULL([DCM_ProjectByEmployee].[RecordID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_ProjectByEmployee].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_ProjectByEmployee].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users2].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users2].[UserFullName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users2].[ExtnNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users2].[MobileNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users2].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects1].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([DCM_Projects1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'RecordID' THEN [DCM_ProjectByEmployee].[RecordID] END,
     CASE @orderBy WHEN 'RecordID DESC' THEN [DCM_ProjectByEmployee].[RecordID] END DESC,
     CASE @orderBy WHEN 'CardNo' THEN [DCM_ProjectByEmployee].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [DCM_ProjectByEmployee].[CardNo] END DESC,
     CASE @orderBy WHEN 'ProjectID' THEN [DCM_ProjectByEmployee].[ProjectID] END,
     CASE @orderBy WHEN 'ProjectID DESC' THEN [DCM_ProjectByEmployee].[ProjectID] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserName' THEN [aspnet_Users2].[UserName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserName DESC' THEN [aspnet_Users2].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_ExtnNo' THEN [aspnet_Users2].[ExtnNo] END,
     CASE @orderBy WHEN 'aspnet_Users2_ExtnNo DESC' THEN [aspnet_Users2].[ExtnNo] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_MobileNo' THEN [aspnet_Users2].[MobileNo] END,
     CASE @orderBy WHEN 'aspnet_Users2_MobileNo DESC' THEN [aspnet_Users2].[MobileNo] END DESC,
     CASE @orderBy WHEN 'aspnet_Users2_EMailID' THEN [aspnet_Users2].[EMailID] END,
     CASE @orderBy WHEN 'aspnet_Users2_EMailID DESC' THEN [aspnet_Users2].[EMailID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectID' THEN [DCM_Projects1].[ProjectID] END,
     CASE @orderBy WHEN 'DCM_Projects1_ProjectID DESC' THEN [DCM_Projects1].[ProjectID] END DESC,
     CASE @orderBy WHEN 'DCM_Projects1_Description' THEN [DCM_Projects1].[Description] END,
     CASE @orderBy WHEN 'DCM_Projects1_Description DESC' THEN [DCM_Projects1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[DCM_ProjectByEmployee].[RecordID],
		[DCM_ProjectByEmployee].[CardNo],
		[DCM_ProjectByEmployee].[ProjectID],
		[aspnet_Users2].[UserName] AS aspnet_Users2_UserName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users2].[ExtnNo] AS aspnet_Users2_ExtnNo,
		[aspnet_Users2].[MobileNo] AS aspnet_Users2_MobileNo,
		[aspnet_Users2].[EMailID] AS aspnet_Users2_EMailID,
		[DCM_Projects1].[ProjectID] AS DCM_Projects1_ProjectID,
		[DCM_Projects1].[Description] AS DCM_Projects1_Description 
  FROM [DCM_ProjectByEmployee] 
    	INNER JOIN #PageIndex
          ON [DCM_ProjectByEmployee].[RecordID] = #PageIndex.RecordID
  INNER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [DCM_ProjectByEmployee].[CardNo] = [aspnet_Users2].[UserName]
  INNER JOIN [DCM_Projects] AS [DCM_Projects1]
    ON [DCM_ProjectByEmployee].[ProjectID] = [DCM_Projects1].[ProjectID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
