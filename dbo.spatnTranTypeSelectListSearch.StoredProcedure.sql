USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeSelectListSearch]
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
  TranType NVarChar(3) NOT NULL
  )
  INSERT INTO #PageIndex (TranType)
  SELECT [ATN_TranType].[TranType] FROM [ATN_TranType]
 WHERE  
   ( 
         LOWER(ISNULL([ATN_TranType].[TranType],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ATN_TranType].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TranType' THEN [ATN_TranType].[TranType] END,
     CASE @orderBy WHEN 'TranType DESC' THEN [ATN_TranType].[TranType] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ATN_TranType].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ATN_TranType].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ATN_TranType].[TranType],
		[ATN_TranType].[Description] 
  FROM [ATN_TranType] 
    	INNER JOIN #PageIndex
          ON [ATN_TranType].[TranType] = #PageIndex.TranType
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
