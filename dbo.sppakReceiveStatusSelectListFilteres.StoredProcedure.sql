USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakReceiveStatusSelectListFilteres]
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
 ,ReceiveStatusID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'ReceiveStatusID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PAK_ReceiveStatus].[ReceiveStatusID]'
  SET @LGSQL = @LGSQL + ' FROM [PAK_ReceiveStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ReceiveStatusID' THEN '[PAK_ReceiveStatus].[ReceiveStatusID]'
                        WHEN 'ReceiveStatusID DESC' THEN '[PAK_ReceiveStatus].[ReceiveStatusID] DESC'
                        WHEN 'Description' THEN '[PAK_ReceiveStatus].[Description]'
                        WHEN 'Description DESC' THEN '[PAK_ReceiveStatus].[Description] DESC'
                        ELSE '[PAK_ReceiveStatus].[ReceiveStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [PAK_ReceiveStatus].*  
  FROM [PAK_ReceiveStatus] 
      INNER JOIN #PageIndex
          ON [PAK_ReceiveStatus].[ReceiveStatusID] = #PageIndex.ReceiveStatusID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
