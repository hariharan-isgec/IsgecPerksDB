USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferDetailsInsert]
  @TransferID Int,
  @MrnID Int,
  @AssetID Int,
  @AssetTypeID NVarChar(10),
  @MrnDate DateTime,
  @SupplierID Int,
  @BrandID NVarChar(15),
  @ModelNo NVarChar(50),
  @OtherSpecifications NVarChar(50),
  @RecievedAt Int,
  @AssetNo NVarChar(50),
  @AssetSerialNo NVarChar(50),
  @Issued Bit,
  @Returnable Bit,
  @ExpectedDate DateTime,
  @Transferred Bit,
  @ToOfficeID Int,
  @RecievedTransfered Bit,
  @FromOfficeID Int,
  @OnRepair Bit,
  @Discarded Bit,
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @ModificationRemarks NVarChar(50),
  @Return_TransferID Int = null OUTPUT
  AS
  INSERT [ASM_TransferDetails]
  (
   [TransferID]
  ,[MrnID]
  ,[AssetID]
  ,[AssetTypeID]
  ,[MrnDate]
  ,[SupplierID]
  ,[BrandID]
  ,[ModelNo]
  ,[OtherSpecifications]
  ,[RecievedAt]
  ,[AssetNo]
  ,[AssetSerialNo]
  ,[Issued]
  ,[Returnable]
  ,[ExpectedDate]
  ,[Transferred]
  ,[ToOfficeID]
  ,[RecievedTransfered]
  ,[FromOfficeID]
  ,[OnRepair]
  ,[Discarded]
  ,[Modified]
  ,[ModifiedOn]
  ,[ModifiedBy]
  ,[ModificationRemarks]
  )
  VALUES
  (
   @TransferID
  ,@MrnID
  ,@AssetID
  ,@AssetTypeID
  ,@MrnDate
  ,@SupplierID
  ,@BrandID
  ,@ModelNo
  ,@OtherSpecifications
  ,@RecievedAt
  ,@AssetNo
  ,@AssetSerialNo
  ,@Issued
  ,@Returnable
  ,@ExpectedDate
  ,@Transferred
  ,@ToOfficeID
  ,@RecievedTransfered
  ,@FromOfficeID
  ,@OnRepair
  ,@Discarded
  ,@Modified
  ,@ModifiedOn
  ,@ModifiedBy
  ,@ModificationRemarks
  )
  SET @Return_TransferID = @TransferID
GO
