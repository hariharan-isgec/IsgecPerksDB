USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spadmMonitorSheetDetailsUpdate]
  @Original_SheetID Int, 
  @Original_SerialNo Int, 
  @ProblemIdentified Bit,
  @MonitorRemarks NVarChar(100),
  @MonitoredBy NVarChar(8),
  @MonitoredOn DateTime,
  @Monitored Bit,
  @RowCount int = null OUTPUT
  AS
  UPDATE [ADM_ServiceSheetDetails] SET 
   [ProblemIdentified] = @ProblemIdentified
  ,[MonitorRemarks] = @MonitorRemarks
  ,[MonitoredBy] = @MonitoredBy
  ,[MonitoredOn] = @MonitoredOn
  ,[Monitored] = @Monitored
  WHERE
  [SheetID] = @Original_SheetID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
