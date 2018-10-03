USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostWorkOrderTypesSelectListFilteres]
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
 ,WorkOrderTypeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'WorkOrderTypeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[COST_WorkOrderTypes].[WorkOrderTypeID]'
  SET @LGSQL = @LGSQL + ' FROM [COST_WorkOrderTypes] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'WorkOrderTypeID' THEN '[COST_WorkOrderTypes].[WorkOrderTypeID]'
                        WHEN 'WorkOrderTypeID DESC' THEN '[COST_WorkOrderTypes].[WorkOrderTypeID] DESC'
                        WHEN 'WorkOrderTypeDescription' THEN '[COST_WorkOrderTypes].[WorkOrderTypeDescription]'
                        WHEN 'WorkOrderTypeDescription DESC' THEN '[COST_WorkOrderTypes].[WorkOrderTypeDescription] DESC'
                        ELSE '[COST_WorkOrderTypes].[WorkOrderTypeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [COST_WorkOrderTypes].*  
  FROM [COST_WorkOrderTypes] 
      INNER JOIN #PageIndex
          ON [COST_WorkOrderTypes].[WorkOrderTypeID] = #PageIndex.WorkOrderTypeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
