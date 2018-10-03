USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrRequestAttachmentsDelete]
  @Original_RequestNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [VR_RequestAttachments]
  WHERE
  [VR_RequestAttachments].[RequestNo] = @Original_RequestNo
  AND [VR_RequestAttachments].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
