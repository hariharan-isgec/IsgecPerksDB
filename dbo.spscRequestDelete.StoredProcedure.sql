USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spscRequestDelete]
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SC_Request]
  WHERE
  [SC_Request].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
