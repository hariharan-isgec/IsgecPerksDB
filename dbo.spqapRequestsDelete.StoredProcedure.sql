USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapRequestsDelete]
  @Original_RequestNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_Requests]
  WHERE
  [QAP_Requests].[RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
GO
