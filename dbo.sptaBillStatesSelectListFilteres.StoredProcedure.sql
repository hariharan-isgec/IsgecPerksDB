USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaBillStatesSelectListFilteres]
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
 ,BillStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'BillStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[TA_BillStates].[BillStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [TA_BillStates] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'BillStatusID' THEN '[TA_BillStates].[BillStatusID]'
                        WHEN 'BillStatusID DESC' THEN '[TA_BillStates].[BillStatusID] DESC'
                        WHEN 'Description' THEN '[TA_BillStates].[Description]'
                        WHEN 'Description DESC' THEN '[TA_BillStates].[Description] DESC'
                        ELSE '[TA_BillStates].[BillStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[TA_BillStates].[BillStatusID] ,
		[TA_BillStates].[Description]  
  FROM [TA_BillStates] 
      INNER JOIN #PageIndex
          ON [TA_BillStates].[BillStatusID] = #PageIndex.BillStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
