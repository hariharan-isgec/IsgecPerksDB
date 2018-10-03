USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallStatusSelectListSearch]
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
 ,CallStatusID NVarChar(20) NOT NULL
  )
  INSERT INTO #PageIndex (CallStatusID)
  SELECT [ADM_CallStatus].[CallStatusID] FROM [ADM_CallStatus]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_CallStatus].[CallStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_CallStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CallStatusID' THEN [ADM_CallStatus].[CallStatusID] END,
     CASE @orderBy WHEN 'CallStatusID DESC' THEN [ADM_CallStatus].[CallStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ADM_CallStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ADM_CallStatus].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_CallStatus].[CallStatusID],
		[ADM_CallStatus].[Description] 
  FROM [ADM_CallStatus] 
    	INNER JOIN #PageIndex
          ON [ADM_CallStatus].[CallStatusID] = #PageIndex.CallStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
