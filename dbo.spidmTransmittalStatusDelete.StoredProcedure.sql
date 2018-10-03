USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spidmTransmittalStatusDelete]
  @Original_TmtlStatusID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [IDM_TransmittalStatus]
  WHERE
  [IDM_TransmittalStatus].[TmtlStatusID] = @Original_TmtlStatusID
  SET @RowCount = @@RowCount
GO
