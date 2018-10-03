USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkBillDetailsDelete]
  @Original_AttachmentID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_BillDetails]
  WHERE
  [PRK_BillDetails].[AttachmentID] = @Original_AttachmentID
  SET @RowCount = @@RowCount
GO
