USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spolcRequestsUpdate]
  @Original_RequestID Int, 
  @CardNo NVarChar(8),
  @Remarks NVarChar(500),
  @RequestedBy NVarChar(8),
  @RequestedOn DateTime,
  @Configured Bit,
  @OLCPassword NVarChar(50),
  @NetworkIP NVarChar(15),
  @ConfiguredBy NVarChar(8),
  @ConfiguredOn DateTime,
  @ConfigurationRemarks NVarChar(500),
  @RemoveAccess Bit,
  @RemoveRequestedBy NVarChar(8),
  @RemoveRequestedOn DateTime,
  @RemoveRemarks NVarChar(500),
  @Removed Bit,
  @RemovedBy NVarChar(8),
  @RemovedOn DateTime,
  @RemovedRemarks NVarChar(500),
  @RowCount int = null OUTPUT
  AS
  UPDATE [OLC_Requests] SET 
   [CardNo] = @CardNo
  ,[Remarks] = @Remarks
  ,[RequestedBy] = @RequestedBy
  ,[RequestedOn] = @RequestedOn
  ,[Configured] = @Configured
  ,[OLCPassword] = @OLCPassword
  ,[NetworkIP] = @NetworkIP
  ,[ConfiguredBy] = @ConfiguredBy
  ,[ConfiguredOn] = @ConfiguredOn
  ,[ConfigurationRemarks] = @ConfigurationRemarks
  ,[RemoveAccess] = @RemoveAccess
  ,[RemoveRequestedBy] = @RemoveRequestedBy
  ,[RemoveRequestedOn] = @RemoveRequestedOn
  ,[RemoveRemarks] = @RemoveRemarks
  ,[Removed] = @Removed
  ,[RemovedBy] = @RemovedBy
  ,[RemovedOn] = @RemovedOn
  ,[RemovedRemarks] = @RemovedRemarks
  WHERE
  [RequestID] = @Original_RequestID
  SET @RowCount = @@RowCount
GO
