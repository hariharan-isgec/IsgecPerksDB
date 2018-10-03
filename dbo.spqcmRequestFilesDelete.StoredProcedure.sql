USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestFilesDelete]
  @Original_RequestID Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_RequestFiles]
  WHERE
  [QCM_RequestFiles].[RequestID] = @Original_RequestID
  AND [QCM_RequestFiles].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
