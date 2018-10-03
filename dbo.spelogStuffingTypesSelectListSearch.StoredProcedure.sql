USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogStuffingTypesSelectListSearch]
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
 ,StuffingTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (StuffingTypeID)
  SELECT [ELOG_StuffingTypes].[StuffingTypeID] FROM [ELOG_StuffingTypes]
 WHERE  
   ( 
         STR(ISNULL([ELOG_StuffingTypes].[StuffingTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ELOG_StuffingTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'StuffingTypeID' THEN [ELOG_StuffingTypes].[StuffingTypeID] END,
     CASE @OrderBy WHEN 'StuffingTypeID DESC' THEN [ELOG_StuffingTypes].[StuffingTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ELOG_StuffingTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ELOG_StuffingTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [ELOG_StuffingTypes].*  
  FROM [ELOG_StuffingTypes] 
      INNER JOIN #PageIndex
          ON [ELOG_StuffingTypes].[StuffingTypeID] = #PageIndex.StuffingTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
