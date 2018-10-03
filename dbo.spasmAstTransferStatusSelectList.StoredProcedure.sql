USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusSelectList]
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[ASM_AstTransferStatus].[TransferStatusID],
		[ASM_AstTransferStatus].[Description] 
  FROM [ASM_AstTransferStatus] 
  ORDER BY
     CASE @orderBy WHEN 'TransferStatusID' THEN [ASM_AstTransferStatus].[TransferStatusID] END,
     CASE @orderBy WHEN 'TransferStatusID DESC' THEN [ASM_AstTransferStatus].[TransferStatusID] END DESC,
     CASE @orderBy WHEN 'Description' THEN [ASM_AstTransferStatus].[Description] END,
     CASE @orderBy WHEN 'Description DESC' THEN [ASM_AstTransferStatus].[Description] END DESC 
  SET @RecordCount = @@RowCount
GO
