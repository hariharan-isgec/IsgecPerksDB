USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus1SelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  FunctionalStatusID1 Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (FunctionalStatusID1) ' + 
               'SELECT [HRM_FunctionalStatus1].[FunctionalStatusID1] FROM [HRM_FunctionalStatus1] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FunctionalStatusID1' THEN '[HRM_FunctionalStatus1].[FunctionalStatusID1]'
                        WHEN 'FunctionalStatusID1 DESC' THEN '[HRM_FunctionalStatus1].[FunctionalStatusID1] DESC'
                        WHEN 'Description' THEN '[HRM_FunctionalStatus1].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_FunctionalStatus1].[Description] DESC'
                        ELSE '[HRM_FunctionalStatus1].[FunctionalStatusID1]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus1].[FunctionalStatusID1],
		[HRM_FunctionalStatus1].[Description] 
  FROM [HRM_FunctionalStatus1] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus1].[FunctionalStatusID1] = #PageIndex.FunctionalStatusID1
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
