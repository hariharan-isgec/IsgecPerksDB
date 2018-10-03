USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkBillDetailsDelete]
  @Original_ClaimID Int,
  @Original_ApplicationID Int,
  @Original_AttachmentID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_BillDetails]
  WHERE
  [PRK_BillDetails].[ClaimID] = @Original_ClaimID
  AND [PRK_BillDetails].[ApplicationID] = @Original_ApplicationID
  AND [PRK_BillDetails].[AttachmentID] = @Original_AttachmentID
  SET @RowCount = @@RowCount
GO
