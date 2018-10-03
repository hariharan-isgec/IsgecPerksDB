USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpRequestAttachmentsDelete]
  @Original_ApplID Int,
  @Original_RequestID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ERP_RequestAttachments]
  WHERE
  [ERP_RequestAttachments].[ApplID] = @Original_ApplID
  AND [ERP_RequestAttachments].[RequestID] = @Original_RequestID
  AND [ERP_RequestAttachments].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
