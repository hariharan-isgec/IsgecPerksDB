USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL
 ,TransferStatusID NVarChar(30) NOT NULL
  )
  INSERT INTO #PageIndex (TransferStatusID)
  SELECT [ASM_AstTransferStatus].[TransferStatusID] FROM [ASM_AstTransferStatus]
 WHERE  
   ( 
         LOWER(ISNULL([ASM_AstTransferStatus].[TransferStatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ASM_AstTransferStatus].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'TransferStatusID' THEN [ASM_AstTransferStatus].[TransferStatusID] END,
     CASE @orderBy WHEN 'TransferStatusID DESC' THEN [ASM_AstTransferStatus].[TransferStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstTransferStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstTransferStatus].[Description] END DESC 

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
