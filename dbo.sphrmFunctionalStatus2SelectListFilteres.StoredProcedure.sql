USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus2SelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  FunctionalStatusID2 Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (FunctionalStatusID2) ' + 
               'SELECT [HRM_FunctionalStatus2].[FunctionalStatusID2] FROM [HRM_FunctionalStatus2] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FunctionalStatusID2' THEN '[HRM_FunctionalStatus2].[FunctionalStatusID2]'
                        WHEN 'FunctionalStatusID2 DESC' THEN '[HRM_FunctionalStatus2].[FunctionalStatusID2] DESC'
                        WHEN 'Description' THEN '[HRM_FunctionalStatus2].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_FunctionalStatus2].[Description] DESC'
                        ELSE '[HRM_FunctionalStatus2].[FunctionalStatusID2]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus2].[FunctionalStatusID2],
		[HRM_FunctionalStatus2].[Description] 
  FROM [HRM_FunctionalStatus2] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus2].[FunctionalStatusID2] = #PageIndex.FunctionalStatusID2
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
