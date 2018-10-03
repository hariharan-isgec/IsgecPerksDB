USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBRowColsSelectListSearch]
  @LoginID NVarChar(8),
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
 ,DashboardID Int NOT NULL
 ,DBRows Int NOT NULL
 ,DBCols Int NOT NULL
  )
  INSERT INTO #PageIndex (DashboardID, DBRows, DBCols)
  SELECT [WF_DBRowCols].[DashboardID], [WF_DBRowCols].[DBRows], [WF_DBRowCols].[DBCols] FROM [WF_DBRowCols]
  LEFT OUTER JOIN [WF_Dashboards] AS [WF_Dashboards1]
    ON [WF_DBRowCols].[DashboardID] = [WF_Dashboards1].[DashboardID]
  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_DBRowCols].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_DBRowCols].[DBRows] = [WF_DBRows2].[DBRows]
 WHERE  
   ( 
         STR(ISNULL([WF_DBRowCols].[DBCols], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowCols].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowCols].[DBFieldName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowCols].[cssHeader],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowCols].[cssCell],'')) LIKE @KeyWord1
     OR STR(ISNULL([WF_DBRowCols].[Sequence], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_DBRowCols].[DashboardID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([WF_DBRowCols].[DBRows], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBRowCols].[LinkURL],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DashboardID' THEN [WF_DBRowCols].[DashboardID] END,
     CASE @OrderBy WHEN 'DashboardID DESC' THEN [WF_DBRowCols].[DashboardID] END DESC,
     CASE @OrderBy WHEN 'DBRows' THEN [WF_DBRowCols].[DBRows] END,
     CASE @OrderBy WHEN 'DBRows DESC' THEN [WF_DBRowCols].[DBRows] END DESC,
     CASE @OrderBy WHEN 'DBCols' THEN [WF_DBRowCols].[DBCols] END,
     CASE @OrderBy WHEN 'DBCols DESC' THEN [WF_DBRowCols].[DBCols] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_DBRowCols].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_DBRowCols].[Description] END DESC,
     CASE @OrderBy WHEN 'DBFieldName' THEN [WF_DBRowCols].[DBFieldName] END,
     CASE @OrderBy WHEN 'DBFieldName DESC' THEN [WF_DBRowCols].[DBFieldName] END DESC,
     CASE @OrderBy WHEN 'LinkURL' THEN [WF_DBRowCols].[LinkURL] END,
     CASE @OrderBy WHEN 'LinkURL DESC' THEN [WF_DBRowCols].[LinkURL] END DESC,
     CASE @OrderBy WHEN 'cssHeader' THEN [WF_DBRowCols].[cssHeader] END,
     CASE @OrderBy WHEN 'cssHeader DESC' THEN [WF_DBRowCols].[cssHeader] END DESC,
     CASE @OrderBy WHEN 'cssCell' THEN [WF_DBRowCols].[cssCell] END,
     CASE @OrderBy WHEN 'cssCell DESC' THEN [WF_DBRowCols].[cssCell] END DESC,
     CASE @OrderBy WHEN 'Sequence' THEN [WF_DBRowCols].[Sequence] END,
     CASE @OrderBy WHEN 'Sequence DESC' THEN [WF_DBRowCols].[Sequence] END DESC,
     CASE @OrderBy WHEN 'WF_Dashboards1_DBDescription' THEN [WF_Dashboards1].[DBDescription] END,
     CASE @OrderBy WHEN 'WF_Dashboards1_DBDescription DESC' THEN [WF_Dashboards1].[DBDescription] END DESC,
     CASE @OrderBy WHEN 'WF_DBRows2_Description' THEN [WF_DBRows2].[Description] END,
     CASE @OrderBy WHEN 'WF_DBRows2_Description DESC' THEN [WF_DBRows2].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_DBRowCols].* ,
    [WF_Dashboards1].[DBDescription] AS WF_Dashboards1_DBDescription,
    [WF_DBRows2].[Description] AS WF_DBRows2_Description 
  FROM [WF_DBRowCols] 
      INNER JOIN #PageIndex
          ON [WF_DBRowCols].[DashboardID] = #PageIndex.DashboardID
          AND [WF_DBRowCols].[DBRows] = #PageIndex.DBRows
          AND [WF_DBRowCols].[DBCols] = #PageIndex.DBCols
  LEFT OUTER JOIN [WF_Dashboards] AS [WF_Dashboards1]
    ON [WF_DBRowCols].[DashboardID] = [WF_Dashboards1].[DashboardID]
  LEFT OUTER JOIN [WF_DBRows] AS [WF_DBRows2]
    ON [WF_DBRowCols].[DashboardID] = [WF_DBRows2].[DashboardID]
    AND [WF_DBRowCols].[DBRows] = [WF_DBRows2].[DBRows]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
