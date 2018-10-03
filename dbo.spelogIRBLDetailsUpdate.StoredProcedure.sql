USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDetailsUpdate]
  @Original_IRNo Int, 
  @Original_SerialNo Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_IRBLDetails] SET 
   [IRNo] = @IRNo
  ,[StuffingTypeID] = @StuffingTypeID
  ,[StuffingPointID] = @StuffingPointID
  ,[ICDCFSID] = @ICDCFSID
  ,[OtherICDCFS] = @OtherICDCFS
  ,[BreakBulkID] = @BreakBulkID
  ,[ChargeTypeID] = @ChargeTypeID
  ,[ChargeCategoryID] = @ChargeCategoryID
  ,[ChargeCodeID] = @ChargeCodeID
  ,[Amount] = @Amount
  ,[Remarks] = @Remarks
  WHERE
  [IRNo] = @Original_IRNo
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
