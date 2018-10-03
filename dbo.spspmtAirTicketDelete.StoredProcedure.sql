USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtAirTicketDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_AirTicket]
  WHERE
  [SPMT_AirTicket].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
