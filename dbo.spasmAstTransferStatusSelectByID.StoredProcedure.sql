USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstTransferStatusSelectByID]
  @TransferStatusID NVarChar(30) 
  AS
  SELECT
		[ASM_AstTransferStatus].[TransferStatusID],
		[ASM_AstTransferStatus].[Description] 
  FROM [ASM_AstTransferStatus] 
  WHERE
  [ASM_AstTransferStatus].[TransferStatusID] = @TransferStatusID
GO
