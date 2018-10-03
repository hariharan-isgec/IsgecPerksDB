USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentsDelete]
  @Original_RequestNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_Attachments]
  WHERE
  [QAP_Attachments].[RequestNo] = @Original_RequestNo
  AND [QAP_Attachments].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
