USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmCallTypesSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,CallTypeID NVarChar(20) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'CallTypeID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ADM_CallTypes].[CallTypeID]'  SET @LGSQL = @LGSQL + ' FROM [ADM_CallTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CallTypeID' THEN '[ADM_CallTypes].[CallTypeID]'
                        WHEN 'CallTypeID DESC' THEN '[ADM_CallTypes].[CallTypeID] DESC'
                        WHEN 'Description' THEN '[ADM_CallTypes].[Description]'
                        WHEN 'Description DESC' THEN '[ADM_CallTypes].[Description] DESC'
                        ELSE '[ADM_CallTypes].[CallTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ADM_CallTypes].[CallTypeID],
		[ADM_CallTypes].[Description] 
  FROM [ADM_CallTypes] 
    	INNER JOIN #PageIndex
          ON [ADM_CallTypes].[CallTypeID] = #PageIndex.CallTypeID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
