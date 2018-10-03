USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmFunctionalStatus3SelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  FunctionalStatusID3 Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (FunctionalStatusID3) ' + 
               'SELECT [HRM_FunctionalStatus3].[FunctionalStatusID3] FROM [HRM_FunctionalStatus3] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FunctionalStatusID3' THEN '[HRM_FunctionalStatus3].[FunctionalStatusID3]'
                        WHEN 'FunctionalStatusID3 DESC' THEN '[HRM_FunctionalStatus3].[FunctionalStatusID3] DESC'
                        WHEN 'Description' THEN '[HRM_FunctionalStatus3].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_FunctionalStatus3].[Description] DESC'
                        ELSE '[HRM_FunctionalStatus3].[FunctionalStatusID3]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_FunctionalStatus3].[FunctionalStatusID3],
		[HRM_FunctionalStatus3].[Description] 
  FROM [HRM_FunctionalStatus3] 
    	INNER JOIN #PageIndex
          ON [HRM_FunctionalStatus3].[FunctionalStatusID3] = #PageIndex.FunctionalStatusID3
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
