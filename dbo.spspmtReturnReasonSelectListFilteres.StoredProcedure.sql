USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtReturnReasonSelectListFilteres]
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
 ,ReasonID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReasonID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[SPMT_ReturnReason].[ReasonID]'
  SET @LGSQL = @LGSQL + ' FROM [SPMT_ReturnReason] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReasonID' THEN '[SPMT_ReturnReason].[ReasonID]'
                        WHEN 'ReasonID DESC' THEN '[SPMT_ReturnReason].[ReasonID] DESC'
                        WHEN 'Description' THEN '[SPMT_ReturnReason].[Description]'
                        WHEN 'Description DESC' THEN '[SPMT_ReturnReason].[Description] DESC'
                        ELSE '[SPMT_ReturnReason].[ReasonID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [SPMT_ReturnReason].*  
  FROM [SPMT_ReturnReason] 
      INNER JOIN #PageIndex
          ON [SPMT_ReturnReason].[ReasonID] = #PageIndex.ReasonID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
