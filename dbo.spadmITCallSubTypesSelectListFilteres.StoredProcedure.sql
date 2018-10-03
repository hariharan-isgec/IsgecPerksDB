USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmITCallSubTypesSelectListFilteres]
  @Filter_CallTypeID NVarChar(20),
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,CallTypeID NVarChar(20) NOT NULL
 ,CallSubTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallTypeID'
  SET @LGSQL = @LGSQL + ', CallSubTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_ITCallSubTypes].[CallTypeID]'
  SET @LGSQL = @LGSQL + ', [ADM_ITCallSubTypes].[CallSubTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [ADM_ITCallSubTypes] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [ADM_ITCallTypes] AS [ADM_ITCallTypes1]'
  SET @LGSQL = @LGSQL + '    ON [ADM_ITCallSubTypes].[CallTypeID] = [ADM_ITCallTypes1].[CallTypeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_CallTypeID > '') 
    SET @LGSQL = @LGSQL + ' AND [ADM_ITCallSubTypes].[CallTypeID] = ''' + @Filter_CallTypeID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallTypeID' THEN '[ADM_ITCallSubTypes].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_ITCallSubTypes].[CallTypeID] DESC'
                        WHEN 'CallSubTypeID' THEN '[ADM_ITCallSubTypes].[CallSubTypeID]'
                        WHEN 'CallSubTypeID DESC' THEN '[ADM_ITCallSubTypes].[CallSubTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_ITCallSubTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_ITCallSubTypes].[Description] DESC'
                        WHEN 'ADM_ITCallTypes1_Description' THEN '[ADM_ITCallTypes1].[Description]'
                        WHEN 'ADM_ITCallTypes1_Description DESC' THEN '[ADM_ITCallTypes1].[Description] DESC'
                        ELSE '[ADM_ITCallSubTypes].[CallTypeID],[ADM_ITCallSubTypes].[CallSubTypeID]'
                    END
  EXEC (@LGSQL)

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
