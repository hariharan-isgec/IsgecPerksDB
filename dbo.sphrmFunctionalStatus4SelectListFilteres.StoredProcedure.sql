USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus4SelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  FunctionalStatusID4 Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (FunctionalStatusID4) ' + 
               'SELECT [HRM_FunctionalStatus4].[FunctionalStatusID4] FROM [HRM_FunctionalStatus4] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FunctionalStatusID4' THEN '[HRM_FunctionalStatus4].[FunctionalStatusID4]'
                        WHEN 'FunctionalStatusID4 DESC' THEN '[HRM_FunctionalStatus4].[FunctionalStatusID4] DESC'
                        WHEN 'Description' THEN '[HRM_FunctionalStatus4].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_FunctionalStatus4].[Description] DESC'
                        ELSE '[HRM_FunctionalStatus4].[FunctionalStatusID4]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus4].[FunctionalStatusID4],
		[HRM_FunctionalStatus4].[Description] 
  FROM [HRM_FunctionalStatus4] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus4].[FunctionalStatusID4] = #PageIndex.FunctionalStatusID4
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
