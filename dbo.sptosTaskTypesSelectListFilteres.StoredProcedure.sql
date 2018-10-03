USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sptosTaskTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,TaskTypeID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TaskTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TOS_TaskTypes].[TaskTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [TOS_TaskTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TaskTypeID' THEN '[TOS_TaskTypes].[TaskTypeID]'
                        WHEN 'TaskTypeID DESC' THEN '[TOS_TaskTypes].[TaskTypeID] DESC'
                        WHEN 'Description' THEN '[TOS_TaskTypes].[Description]'
                        WHEN 'Description DESC' THEN '[TOS_TaskTypes].[Description] DESC'
                        ELSE '[TOS_TaskTypes].[TaskTypeID]'
                    END
  EXEC (@LGSQL)

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
