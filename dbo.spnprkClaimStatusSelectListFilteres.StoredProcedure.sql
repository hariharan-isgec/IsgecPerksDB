USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkClaimStatusSelectListFilteres]
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
 ,ClaimStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ClaimStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_ClaimStatus].[ClaimStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_ClaimStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ClaimStatusID' THEN '[PRK_ClaimStatus].[ClaimStatusID]'
                        WHEN 'ClaimStatusID DESC' THEN '[PRK_ClaimStatus].[ClaimStatusID] DESC'
                        WHEN 'Description' THEN '[PRK_ClaimStatus].[Description]'
                        WHEN 'Description DESC' THEN '[PRK_ClaimStatus].[Description] DESC'
                        ELSE '[PRK_ClaimStatus].[ClaimStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PRK_ClaimStatus].*  
  FROM [PRK_ClaimStatus] 
      INNER JOIN #PageIndex
          ON [PRK_ClaimStatus].[ClaimStatusID] = #PageIndex.ClaimStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
