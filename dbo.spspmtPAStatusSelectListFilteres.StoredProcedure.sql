USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtPAStatusSelectListFilteres]
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
 ,AdviceStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'AdviceStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_PAStatus].[AdviceStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_PAStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'AdviceStatusID' THEN '[SPMT_PAStatus].[AdviceStatusID]'
                        WHEN 'AdviceStatusID DESC' THEN '[SPMT_PAStatus].[AdviceStatusID] DESC'
                        WHEN 'Description' THEN '[SPMT_PAStatus].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_PAStatus].[Description] DESC'
                        WHEN 'NextStatusID' THEN '[SPMT_PAStatus].[NextStatusID]'
                        WHEN 'NextStatusID DESC' THEN '[SPMT_PAStatus].[NextStatusID] DESC'
                        ELSE '[SPMT_PAStatus].[AdviceStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_PAStatus].*  
  FROM [SPMT_PAStatus] 
      INNER JOIN #PageIndex
          ON [SPMT_PAStatus].[AdviceStatusID] = #PageIndex.AdviceStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
