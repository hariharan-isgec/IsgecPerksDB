USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferHeaderSelectByID]
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
		[ASM_TransferHeader].[CancelledRemarks],
		[ASM_AstTransferStatus1].[TransferStatusID] AS ASM_AstTransferStatus1_TransferStatusID,
		[ASM_AstTransferStatus1].[Description] AS ASM_AstTransferStatus1_Description,
		[HRM_Offices8].[OfficeID] AS HRM_Offices8_OfficeID,
		[HRM_Offices8].[Description] AS HRM_Offices8_Description,
		[HRM_Offices9].[OfficeID] AS HRM_Offices9_OfficeID,
		[HRM_Offices9].[Description] AS HRM_Offices9_Description 
  FROM [ASM_TransferHeader] 
  LEFT OUTER JOIN [ASM_AstTransferStatus] AS [ASM_AstTransferStatus1]
    ON [ASM_TransferHeader].[TransferStatusID] = [ASM_AstTransferStatus1].[TransferStatusID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices8]
    ON [ASM_TransferHeader].[TransferTo] = [HRM_Offices8].[OfficeID]
  INNER JOIN [HRM_Offices] AS [HRM_Offices9]
    ON [ASM_TransferHeader].[TransferFrom] = [HRM_Offices9].[OfficeID]
  WHERE
  [ASM_TransferHeader].[TransferID] = @TransferID
GO
