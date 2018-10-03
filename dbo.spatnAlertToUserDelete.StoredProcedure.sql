USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnAlertToUserDelete]
  @Original_CardNo NVarChar(8),
  @Original_AttenMonth Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ATNv_PendingRegularization]
  WHERE
  [ATNv_PendingRegularization].[CardNo] = @Original_CardNo
  AND [ATNv_PendingRegularization].[AttenMonth] = @Original_AttenMonth
  SET @RowCount = @@RowCount
GO
