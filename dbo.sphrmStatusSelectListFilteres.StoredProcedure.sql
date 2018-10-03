USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  StatusID NVarChar(2) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (StatusID) ' + 
               'SELECT [HRM_Status].[StatusID] FROM [HRM_Status] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'StatusID' THEN '[HRM_Status].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[HRM_Status].[StatusID] DESC'
                        WHEN 'Description' THEN '[HRM_Status].[Description]'
                        WHEN 'Description DESC' THEN '[HRM_Status].[Description] DESC'
                        WHEN 'Sequence' THEN '[HRM_Status].[Sequence]'
                        WHEN 'Sequence DESC' THEN '[HRM_Status].[Sequence] DESC'
                        ELSE '[HRM_Status].[StatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Status].[StatusID],
		[HRM_Status].[Description],
		[HRM_Status].[Sequence] 
  FROM [HRM_Status] 
    	INNER JOIN #PageIndex
          ON [HRM_Status].[StatusID] = #PageIndex.StatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
