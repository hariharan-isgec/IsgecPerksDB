USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmTransferDetailsUpdate]
  @Original_TransferID Int, 
  @Original_MrnID Int, 
  @Original_AssetID Int, 
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
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_TransferDetails] SET 
   [AssetTypeID] = @AssetTypeID
  ,[MrnDate] = @MrnDate
  ,[SupplierID] = @SupplierID
  ,[BrandID] = @BrandID
  ,[ModelNo] = @ModelNo
  ,[OtherSpecifications] = @OtherSpecifications
  ,[RecievedAt] = @RecievedAt
  ,[AssetNo] = @AssetNo
  ,[AssetSerialNo] = @AssetSerialNo
  ,[Issued] = @Issued
  ,[Returnable] = @Returnable
  ,[ExpectedDate] = @ExpectedDate
  ,[Transferred] = @Transferred
  ,[ToOfficeID] = @ToOfficeID
  ,[RecievedTransfered] = @RecievedTransfered
  ,[FromOfficeID] = @FromOfficeID
  ,[OnRepair] = @OnRepair
  ,[Discarded] = @Discarded
  ,[Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[ModificationRemarks] = @ModificationRemarks
  WHERE
  [TransferID] = @Original_TransferID
  AND [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
