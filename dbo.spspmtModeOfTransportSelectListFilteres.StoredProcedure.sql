USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportSelectListFilteres]
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
 ,ModeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ModeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_ModeOfTransport].[ModeID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_ModeOfTransport] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ModeID' THEN '[SPMT_ModeOfTransport].[ModeID]'
                        WHEN 'ModeID DESC' THEN '[SPMT_ModeOfTransport].[ModeID] DESC'
                        WHEN 'Description' THEN '[SPMT_ModeOfTransport].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_ModeOfTransport].[Description] DESC'
                        ELSE '[SPMT_ModeOfTransport].[ModeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_ModeOfTransport].*  
  FROM [SPMT_ModeOfTransport] 
      INNER JOIN #PageIndex
          ON [SPMT_ModeOfTransport].[ModeID] = #PageIndex.ModeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
