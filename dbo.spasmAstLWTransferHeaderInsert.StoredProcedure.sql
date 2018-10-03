USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstLWTransferHeaderInsert]
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
  @Return_TransferID Int = null OUTPUT
  AS
  INSERT [ASM_TransferHeader]
  (
   [TransferTo]
  ,[TransferFrom]
  ,[Returnable]
  ,[ExpectedDate]
  ,[TransferRemarks]
  ,[T_TakenBy]
  ,[TransferStatusID]
  ,[T_CreatedBy]
  ,[T_CreatedOn]
  ,[T_ApprovedBy]
  ,[T_ApprovedOn]
  ,[T_GateEntryBy]
  ,[T_GateEntryOn]
  ,[T_ReceiveGateEntryBy]
  ,[T_ReceiveGateEntryOn]
  ,[T_ReceivedBy]
  ,[T_ReceivedOn]
  ,[R_TakenBy]
  ,[R_CreatedBy]
  ,[R_CreatedOn]
  ,[R_ApprovedBy]
  ,[R_ApprovedOn]
  ,[R_GateEntryBy]
  ,[R_GateEntryOn]
  ,[R_ReceiveGateEntryBy]
  ,[R_ReceiveGateEntryOn]
  ,[R_ReceivedBy]
  ,[R_ReceivedOn]
  ,[CancelledRemarks]
  )
  VALUES
  (
   @TransferTo
  ,@TransferFrom
  ,@Returnable
  ,@ExpectedDate
  ,@TransferRemarks
  ,@T_TakenBy
  ,@TransferStatusID
  ,@T_CreatedBy
  ,@T_CreatedOn
  ,@T_ApprovedBy
  ,@T_ApprovedOn
  ,@T_GateEntryBy
  ,@T_GateEntryOn
  ,@T_ReceiveGateEntryBy
  ,@T_ReceiveGateEntryOn
  ,@T_ReceivedBy
  ,@T_ReceivedOn
  ,@R_TakenBy
  ,@R_CreatedBy
  ,@R_CreatedOn
  ,@R_ApprovedBy
  ,@R_ApprovedOn
  ,@R_GateEntryBy
  ,@R_GateEntryOn
  ,@R_ReceiveGateEntryBy
  ,@R_ReceiveGateEntryOn
  ,@R_ReceivedBy
  ,@R_ReceivedOn
  ,@CancelledRemarks
  )
  SET @Return_TransferID = Scope_Identity()
GO
