USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmWorkingAreasSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  WorkingAreaID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (WorkingAreaID) ' + 
               'SELECT [HRM_WorkingAreas].[WorkingAreaID] FROM [HRM_WorkingAreas] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'WorkingAreaID' THEN '[HRM_WorkingAreas].[WorkingAreaID]'
                        WHEN 'WorkingAreaID DESC' THEN '[HRM_WorkingAreas].[WorkingAreaID] DESC'
                        WHEN 'Description' THEN '[HRM_WorkingAreas].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_WorkingAreas].[Description] DESC'
                        ELSE '[HRM_WorkingAreas].[WorkingAreaID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_WorkingAreas].[WorkingAreaID],
		[HRM_WorkingAreas].[Description] 
  FROM [HRM_WorkingAreas] 
    	INNER JOIN #PageIndex
          ON [HRM_WorkingAreas].[WorkingAreaID] = #PageIndex.WorkingAreaID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
