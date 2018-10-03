USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosCLPOutlookSelectListSearch]
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
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,ProjectID NVarChar(6) NOT NULL
 ,ProgressID Int NOT NULL
  )
  INSERT INTO #PageIndex (ProjectID, ProgressID)
  SELECT [TOS_CLPData].[ProjectID], [TOS_CLPData].[ProgressID] FROM [TOS_CLPData]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_CLPData].[CreatedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects2]
    ON [TOS_CLPData].[ProjectID] = [TOS_Projects2].[ProjectID]
 WHERE  
   ( 
         LOWER(ISNULL([TOS_CLPData].[ProjectID],'')) LIKE @KeyWord1
     OR STR(ISNULL([TOS_CLPData].[ProgressID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPData].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_CLPData].[CreatedBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'ProjectID' THEN [TOS_CLPData].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [TOS_CLPData].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'ProgressID' THEN [TOS_CLPData].[ProgressID] END,
     CASE @OrderBy WHEN 'ProgressID DESC' THEN [TOS_CLPData].[ProgressID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_CLPData].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_CLPData].[Description] END DESC,
     CASE @OrderBy WHEN 'AsOn' THEN [TOS_CLPData].[AsOn] END,
     CASE @OrderBy WHEN 'AsOn DESC' THEN [TOS_CLPData].[AsOn] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [TOS_CLPData].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [TOS_CLPData].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [TOS_CLPData].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [TOS_CLPData].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'Active' THEN [TOS_CLPData].[Active] END,
     CASE @OrderBy WHEN 'Active DESC' THEN [TOS_CLPData].[Active] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'TOS_Projects2_Description' THEN [TOS_Projects2].[Description] END,
     CASE @OrderBy WHEN 'TOS_Projects2_Description DESC' THEN [TOS_Projects2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOS_CLPData].[ProjectID] ,
		[TOS_CLPData].[ProgressID] ,
		[TOS_CLPData].[Description] ,
		[TOS_CLPData].[AsOn] ,
		[TOS_CLPData].[CreatedBy] ,
		[TOS_CLPData].[CreatedOn] ,
		[TOS_CLPData].[Active] ,
		[TOS_CLPData].[DueByDays] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[TOS_Projects2].[Description] AS TOS_Projects2_Description 
  FROM [TOS_CLPData] 
    	INNER JOIN #PageIndex
          ON [TOS_CLPData].[ProjectID] = #PageIndex.ProjectID
          AND [TOS_CLPData].[ProgressID] = #PageIndex.ProgressID
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [TOS_CLPData].[CreatedBy] = [aspnet_Users1].[LoginID]
  INNER JOIN [TOS_Projects] AS [TOS_Projects2]
    ON [TOS_CLPData].[ProjectID] = [TOS_Projects2].[ProjectID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
