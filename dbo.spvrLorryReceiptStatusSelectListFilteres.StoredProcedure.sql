USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptStatusSelectListFilteres]
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
 ,LRStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'LRStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[VR_LorryReceiptStatus].[LRStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [VR_LorryReceiptStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'LRStatusID' THEN '[VR_LorryReceiptStatus].[LRStatusID]'
                        WHEN 'LRStatusID DESC' THEN '[VR_LorryReceiptStatus].[LRStatusID] DESC'
                        WHEN 'Description' THEN '[VR_LorryReceiptStatus].[Description]'
                        WHEN 'Description DESC' THEN '[VR_LorryReceiptStatus].[Description] DESC'
                        ELSE '[VR_LorryReceiptStatus].[LRStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [VR_LorryReceiptStatus].*  
  FROM [VR_LorryReceiptStatus] 
      INNER JOIN #PageIndex
          ON [VR_LorryReceiptStatus].[LRStatusID] = #PageIndex.LRStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
