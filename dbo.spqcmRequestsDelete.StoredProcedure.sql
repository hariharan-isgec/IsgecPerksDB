USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqcmRequestsDelete]
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QCM_Requests]
  WHERE
  [QCM_Requests].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
