USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDetailsInsert]
  @IRNo Int,
  @StuffingTypeID Int,
  @StuffingPointID Int,
  @ICDCFSID Int,
  @OtherICDCFS NVarChar(100),
  @BreakBulkID Int,
  @ChargeTypeID Int,
  @ChargeCategoryID Int,
  @ChargeCodeID Int,
  @Amount Decimal(18,2),
  @Remarks NVarChar(500),
  @Return_IRNo Int = null OUTPUT, 
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [ELOG_IRBLDetails]
  (
   [IRNo]
  ,[StuffingTypeID]
  ,[StuffingPointID]
  ,[ICDCFSID]
  ,[OtherICDCFS]
  ,[BreakBulkID]
  ,[ChargeTypeID]
  ,[ChargeCategoryID]
  ,[ChargeCodeID]
  ,[Amount]
  ,[Remarks]
  )
  VALUES
  (
   @IRNo
  ,@StuffingTypeID
  ,@StuffingPointID
  ,@ICDCFSID
  ,@OtherICDCFS
  ,@BreakBulkID
  ,@ChargeTypeID
  ,@ChargeCategoryID
  ,@ChargeCodeID
  ,@Amount
  ,@Remarks
  )
  SET @Return_IRNo = @IRNo
  SET @Return_SerialNo = Scope_Identity()
GO
