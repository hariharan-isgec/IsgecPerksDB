USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesSelectListSearch]
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
 ,CallTypeID NVarChar(20) NOT NULL
 ,CallSubTypeID Int NOT NULL
  )
  INSERT INTO #PageIndex (CallTypeID, CallSubTypeID)
  SELECT [ADM_ITCallSubTypes].[CallTypeID], [ADM_ITCallSubTypes].[CallSubTypeID] FROM [ADM_ITCallSubTypes]
  INNER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes1]
    ON [ADM_ITCallSubTypes].[CallTypeID] = [ADM_ITCallTypes1].[CallTypeID]
 WHERE  
   ( 
         LOWER(ISNULL([ADM_ITCallSubTypes].[CallTypeID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ADM_ITCallSubTypes].[CallSubTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ADM_ITCallSubTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'CallTypeID' THEN [ADM_ITCallSubTypes].[CallTypeID] END,
     CASE @OrderBy WHEN 'CallTypeID DESC' THEN [ADM_ITCallSubTypes].[CallTypeID] END DESC,
     CASE @OrderBy WHEN 'CallSubTypeID' THEN [ADM_ITCallSubTypes].[CallSubTypeID] END,
     CASE @OrderBy WHEN 'CallSubTypeID DESC' THEN [ADM_ITCallSubTypes].[CallSubTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [ADM_ITCallSubTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [ADM_ITCallSubTypes].[Description] END DESC,
     CASE @OrderBy WHEN 'ADM_ITCallTypes1_Description' THEN [ADM_ITCallTypes1].[Description] END,
     CASE @OrderBy WHEN 'ADM_ITCallTypes1_Description DESC' THEN [ADM_ITCallTypes1].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ADM_ITCallSubTypes].[CallTypeID] ,
		[ADM_ITCallSubTypes].[CallSubTypeID] ,
		[ADM_ITCallSubTypes].[Description] ,
		[ADM_ITCallTypes1].[Description] AS ADM_ITCallTypes1_Description 
  FROM [ADM_ITCallSubTypes] 
    	INNER JOIN #PageIndex
          ON [ADM_ITCallSubTypes].[CallTypeID] = #PageIndex.CallTypeID
          AND [ADM_ITCallSubTypes].[CallSubTypeID] = #PageIndex.CallSubTypeID
  INNER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes1]
    ON [ADM_ITCallSubTypes].[CallTypeID] = [ADM_ITCallTypes1].[CallTypeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
