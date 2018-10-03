USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorsDelete]
  @Original_ServiceID NVarChar(10),
  @Original_MonitorID NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  DELETE [ADM_Monitors]
  WHERE
  [ADM_Monitors].[ServiceID] = @Original_ServiceID
  AND [ADM_Monitors].[MonitorID] = @Original_MonitorID
  SET @RowCount = @@RowCount
GO
