USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesSelectListSearch]
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
 ,TaskTypeID NVarChar(2) NOT NULL
  )
  INSERT INTO #PageIndex (TaskTypeID)
  SELECT [TOS_TaskTypes].[TaskTypeID] FROM [TOS_TaskTypes]
 WHERE  
   ( 
         LOWER(ISNULL([TOS_TaskTypes].[TaskTypeID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([TOS_TaskTypes].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'TaskTypeID' THEN [TOS_TaskTypes].[TaskTypeID] END,
     CASE @OrderBy WHEN 'TaskTypeID DESC' THEN [TOS_TaskTypes].[TaskTypeID] END DESC,
     CASE @OrderBy WHEN 'Description' THEN [TOS_TaskTypes].[Description] END,
     CASE @OrderBy WHEN 'Description DESC' THEN [TOS_TaskTypes].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[TOS_TaskTypes].[TaskTypeID] ,
		[TOS_TaskTypes].[Description]  
  FROM [TOS_TaskTypes] 
    	INNER JOIN #PageIndex
          ON [TOS_TaskTypes].[TaskTypeID] = #PageIndex.TaskTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
