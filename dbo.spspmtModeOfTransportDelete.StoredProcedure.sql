USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtModeOfTransportDelete]
  @Original_ModeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_ModeOfTransport]
  WHERE
  [SPMT_ModeOfTransport].[ModeID] = @Original_ModeID
  SET @RowCount = @@RowCount
GO
