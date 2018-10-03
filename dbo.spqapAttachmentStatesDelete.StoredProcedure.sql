USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapAttachmentStatesDelete]
  @Original_StatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_AttachmentStates]
  WHERE
  [QAP_AttachmentStates].[StatusID] = @Original_StatusID
  SET @RowCount = @@RowCount
GO
