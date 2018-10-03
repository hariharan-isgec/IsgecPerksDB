USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakInventoryStatusSelectListFilteres]
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
 ,InventoryStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'InventoryStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_InventoryStatus].[InventoryStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_InventoryStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'InventoryStatusID' THEN '[PAK_InventoryStatus].[InventoryStatusID]'
                        WHEN 'InventoryStatusID DESC' THEN '[PAK_InventoryStatus].[InventoryStatusID] DESC'
                        WHEN 'Description' THEN '[PAK_InventoryStatus].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_InventoryStatus].[Description] DESC'
                        ELSE '[PAK_InventoryStatus].[InventoryStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_InventoryStatus].*  
  FROM [PAK_InventoryStatus] 
      INNER JOIN #PageIndex
          ON [PAK_InventoryStatus].[InventoryStatusID] = #PageIndex.InventoryStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
