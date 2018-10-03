USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferHeaderUpdate]
  @Original_TransferID Int, 
  @TransferTo Int,
  @TransferFrom Int,
  @Returnable Bit,
  @ExpectedDate DateTime,
  @TransferRemarks NVarChar(100),
  @T_TakenBy NVarChar(30),
  @TransferStatusID NVarChar(30),
  @T_CreatedBy NVarChar(8),
  @T_CreatedOn DateTime,
  @T_ApprovedBy NVarChar(8),
  @T_ApprovedOn DateTime,
  @T_GateEntryBy NVarChar(30),
  @T_GateEntryOn DateTime,
  @T_ReceiveGateEntryBy NVarChar(30),
  @T_ReceiveGateEntryOn DateTime,
  @T_ReceivedBy NVarChar(8),
  @T_ReceivedOn DateTime,
  @R_TakenBy NVarChar(30),
  @R_CreatedBy NVarChar(8),
  @R_CreatedOn DateTime,
  @R_ApprovedBy NVarChar(8),
  @R_ApprovedOn DateTime,
  @R_GateEntryBy NVarChar(30),
  @R_GateEntryOn DateTime,
  @R_ReceiveGateEntryBy NVarChar(30),
  @R_ReceiveGateEntryOn DateTime,
  @R_ReceivedBy NVarChar(8),
  @R_ReceivedOn DateTime,
  @CancelledRemarks NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_TransferHeader] SET 
   [TransferTo] = @TransferTo
  ,[TransferFrom] = @TransferFrom
  ,[Returnable] = @Returnable
  ,[ExpectedDate] = @ExpectedDate
  ,[TransferRemarks] = @TransferRemarks
  ,[T_TakenBy] = @T_TakenBy
  ,[TransferStatusID] = @TransferStatusID
  ,[T_CreatedBy] = @T_CreatedBy
  ,[T_CreatedOn] = @T_CreatedOn
  ,[T_ApprovedBy] = @T_ApprovedBy
  ,[T_ApprovedOn] = @T_ApprovedOn
  ,[T_GateEntryBy] = @T_GateEntryBy
  ,[T_GateEntryOn] = @T_GateEntryOn
  ,[T_ReceiveGateEntryBy] = @T_ReceiveGateEntryBy
  ,[T_ReceiveGateEntryOn] = @T_ReceiveGateEntryOn
  ,[T_ReceivedBy] = @T_ReceivedBy
  ,[T_ReceivedOn] = @T_ReceivedOn
  ,[R_TakenBy] = @R_TakenBy
  ,[R_CreatedBy] = @R_CreatedBy
  ,[R_CreatedOn] = @R_CreatedOn
  ,[R_ApprovedBy] = @R_ApprovedBy
  ,[R_ApprovedOn] = @R_ApprovedOn
  ,[R_GateEntryBy] = @R_GateEntryBy
  ,[R_GateEntryOn] = @R_GateEntryOn
  ,[R_ReceiveGateEntryBy] = @R_ReceiveGateEntryBy
  ,[R_ReceiveGateEntryOn] = @R_ReceiveGateEntryOn
  ,[R_ReceivedBy] = @R_ReceivedBy
  ,[R_ReceivedOn] = @R_ReceivedOn
  ,[CancelledRemarks] = @CancelledRemarks
  WHERE
  [TransferID] = @Original_TransferID
  SET @RowCount = @@RowCount
GO
