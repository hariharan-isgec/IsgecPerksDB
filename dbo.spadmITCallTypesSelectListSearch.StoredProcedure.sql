USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallTypesSelectListSearch]
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
 ,CallTypeID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (CallTypeID)
  SELECT [ADM_ITCallTypes].[CallTypeID] FROM [ADM_ITCallTypes]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_ITCallTypes].[CallTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITCallTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallTypeID' THEN [ADM_ITCallTypes].[CallTypeID] END,
     CASE @orderBy WHEN 'CallTypeID DESC' THEN [ADM_ITCallTypes].[CallTypeID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_ITCallTypes].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_ITCallTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITCallTypes].[CallTypeID],
		[ADM_ITCallTypes].[Description] 
  FROM [ADM_ITCallTypes] 
    	INNER JOIN #PageIndex
          ON [ADM_ITCallTypes].[CallTypeID] = #PageIndex.CallTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
