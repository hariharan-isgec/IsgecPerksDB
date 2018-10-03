USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrExecutionAttachmentsDelete]
  @Original_SRNNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_ExecutionAttachments]
  WHERE
  [VR_ExecutionAttachments].[SRNNo] = @Original_SRNNo
  AND [VR_ExecutionAttachments].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
