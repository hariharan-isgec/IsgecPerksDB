USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferHeaderSelectByID]
  @TransferID Int 
  AS
  SELECT
		[ASM_TransferHeader].[TransferID],
		[ASM_TransferHeader].[TransferTo],
		[ASM_TransferHeader].[TransferFrom],
		[ASM_TransferHeader].[Returnable],
		[ASM_TransferHeader].[ExpectedDate],
		[ASM_TransferHeader].[TransferRemarks],
		[ASM_TransferHeader].[T_TakenBy],
		[ASM_TransferHeader].[TransferStatusID],
		[ASM_TransferHeader].[T_CreatedBy],
		[ASM_TransferHeader].[T_CreatedOn],
		[ASM_TransferHeader].[T_ApprovedBy],
		[ASM_TransferHeader].[T_ApprovedOn],
		[ASM_TransferHeader].[T_GateEntryBy],
		[ASM_TransferHeader].[T_GateEntryOn],
		[ASM_TransferHeader].[T_ReceiveGateEntryBy],
		[ASM_TransferHeader].[T_ReceiveGateEntryOn],
		[ASM_TransferHeader].[T_ReceivedBy],
		[ASM_TransferHeader].[T_ReceivedOn],
		[ASM_TransferHeader].[R_TakenBy],
		[ASM_TransferHeader].[R_CreatedBy],
		[ASM_TransferHeader].[R_CreatedOn],
		[ASM_TransferHeader].[R_ApprovedBy],
		[ASM_TransferHeader].[R_ApprovedOn],
		[ASM_TransferHeader].[R_GateEntryBy],
		[ASM_TransferHeader].[R_GateEntryOn],
		[ASM_TransferHeader].[R_ReceiveGateEntryBy],
		[ASM_TransferHeader].[R_ReceiveGateEntryOn],
		[ASM_TransferHeader].[R_ReceivedBy],
		[ASM_TransferHeader].[R_ReceivedOn],
		[ASM_TransferHeader].[CancelledRemarks] 
  FROM [ASM_TransferHeader] 
  WHERE
  [ASM_TransferHeader].[TransferID] = @TransferID
GO
