USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spwfDBDataSelectListSearch]
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
 ,DBDataID Int NOT NULL
  )
  INSERT INTO #PageIndex (DBDataID)
  SELECT [WF_DBData].[DBDataID] FROM [WF_DBData]
 WHERE  
   ( 
         STR(ISNULL([WF_DBData].[DBDataID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBData].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBData].[AFSDllName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBData].[AFSFunctionName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBData].[AFSParameters],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([WF_DBData].[DataSQL],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'DBDataID' THEN [WF_DBData].[DBDataID] END,
     CASE @OrderBy WHEN 'DBDataID DESC' THEN [WF_DBData].[DBDataID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [WF_DBData].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [WF_DBData].[Description] END DESC,
     CASE @OrderBy WHEN 'IsProcedure' THEN [WF_DBData].[IsProcedure] END,
     CASE @OrderBy WHEN 'IsProcedure DESC' THEN [WF_DBData].[IsProcedure] END DESC,
     CASE @OrderBy WHEN 'FromERP' THEN [WF_DBData].[FromERP] END,
     CASE @OrderBy WHEN 'FromERP DESC' THEN [WF_DBData].[FromERP] END DESC,
     CASE @OrderBy WHEN 'IsList' THEN [WF_DBData].[IsList] END,
     CASE @OrderBy WHEN 'IsList DESC' THEN [WF_DBData].[IsList] END DESC,
     CASE @OrderBy WHEN 'IsErpAFSCall' THEN [WF_DBData].[IsErpAFSCall] END,
     CASE @OrderBy WHEN 'IsErpAFSCall DESC' THEN [WF_DBData].[IsErpAFSCall] END DESC,
     CASE @OrderBy WHEN 'AFSDllName' THEN [WF_DBData].[AFSDllName] END,
     CASE @OrderBy WHEN 'AFSDllName DESC' THEN [WF_DBData].[AFSDllName] END DESC,
     CASE @OrderBy WHEN 'AFSFunctionName' THEN [WF_DBData].[AFSFunctionName] END,
     CASE @OrderBy WHEN 'AFSFunctionName DESC' THEN [WF_DBData].[AFSFunctionName] END DESC,
     CASE @OrderBy WHEN 'AFSParameters' THEN [WF_DBData].[AFSParameters] END,
     CASE @OrderBy WHEN 'AFSParameters DESC' THEN [WF_DBData].[AFSParameters] END DESC,
     CASE @OrderBy WHEN 'DataSQL' THEN [WF_DBData].[DataSQL] END,
     CASE @OrderBy WHEN 'DataSQL DESC' THEN [WF_DBData].[DataSQL] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [WF_DBData].*  
  FROM [WF_DBData] 
      INNER JOIN #PageIndex
          ON [WF_DBData].[DBDataID] = #PageIndex.DBDataID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
