USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcRequestsDelete]
  @Original_RequestID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [OLC_Requests]
  WHERE
  [OLC_Requests].[RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
