USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrLorryReceiptDetailsDelete]
  @Original_ProjectID NVarChar(6),
  @Original_MRNNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_LorryReceiptDetails]
  WHERE
  [VR_LorryReceiptDetails].[ProjectID] = @Original_ProjectID
  AND [VR_LorryReceiptDetails].[MRNNo] = @Original_MRNNo
  AND [VR_LorryReceiptDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
