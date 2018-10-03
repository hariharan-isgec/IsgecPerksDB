USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppakLorryReceiptsDelete]
  @Original_ProjectID NVarChar(6),
  @Original_MRNNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_LorryReceipts]
  WHERE
  [VR_LorryReceipts].[ProjectID] = @Original_ProjectID
  AND [VR_LorryReceipts].[MRNNo] = @Original_MRNNo
  SET @RowCount = @@RowCount
GO
