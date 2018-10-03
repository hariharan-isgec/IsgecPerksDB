USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferStatusID NVarChar(30) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'TransferStatusID'  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ASM_AstTransferStatus].[TransferStatusID]'  SET @LGSQL = @LGSQL + ' FROM [ASM_AstTransferStatus] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'TransferStatusID' THEN '[ASM_AstTransferStatus].[TransferStatusID]'
                        WHEN 'TransferStatusID DESC' THEN '[ASM_AstTransferStatus].[TransferStatusID] DESC'
                        WHEN 'Description' THEN '[ASM_AstTransferStatus].[Description]'
                        WHEN 'Description DESC' THEN '[ASM_AstTransferStatus].[Description] DESC'
                        ELSE '[ASM_AstTransferStatus].[TransferStatusID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[ASM_AstTransferStatus].[TransferStatusID],
		[ASM_AstTransferStatus].[Description] 
  FROM [ASM_AstTransferStatus] 
    	INNER JOIN #PageIndex
          ON [ASM_AstTransferStatus].[TransferStatusID] = #PageIndex.TransferStatusID
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
