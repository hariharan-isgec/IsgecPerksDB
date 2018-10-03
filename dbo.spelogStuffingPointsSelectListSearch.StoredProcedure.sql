USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingPointsSelectListSearch]
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
 ,StuffingPointID Int NOT NULL
  )
  INSERT INTO #PageIndex (StuffingPointID)
  SELECT [ELOG_StuffingPoints].[StuffingPointID] FROM [ELOG_StuffingPoints]
 WHERE  
   ( 
         STR(ISNULL([ELOG_StuffingPoints].[StuffingPointID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_StuffingPoints].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StuffingPointID' THEN [ELOG_StuffingPoints].[StuffingPointID] END,
     CASE @OrderBy WHEN 'StuffingPointID DESC' THEN [ELOG_StuffingPoints].[StuffingPointID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_StuffingPoints].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_StuffingPoints].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_StuffingPoints].*  
  FROM [ELOG_StuffingPoints] 
      INNER JOIN #PageIndex
          ON [ELOG_StuffingPoints].[StuffingPointID] = #PageIndex.StuffingPointID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
