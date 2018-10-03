USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCReceiptsUpdate]
  @MrnDescription NVarChar(30),
  @DateOfPurchase DateTime,
  @WarrantyTill DateTime,
  @InsuranceTill DateTime,
  @SupplierID Int,
  @Keyboard Bit,
  @Mouse Bit,
  @FloppyDrive Bit,
  @PurchasedQuantity Int,
  @pcBrandID Int,
  @NoOfCPUs Int,
  @cpuBrandID Int,
  @CPUModel NVarChar(100),
  @RamID Int,
  @NoOfHDDs Int,
  @TotalHDDGB Int,
  @HDDDetails NVarChar(200),
  @NoOfCDROMs Int,
  @CDRomDetails NVarChar(200),
  @vduBrandID Int,
  @pcOSID Int,
  @pcOSDetails NVarChar(100),
  @Remarks NVarChar(200),
  @Original_MrnID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_MrnPC] SET 
   [MrnDescription] = @MrnDescription
  ,[DateOfPurchase] = @DateOfPurchase
  ,[WarrantyTill] = @WarrantyTill
  ,[InsuranceTill] = @InsuranceTill
  ,[SupplierID] = @SupplierID
  ,[Keyboard] = @Keyboard
  ,[Mouse] = @Mouse
  ,[FloppyDrive] = @FloppyDrive
  ,[PurchasedQuantity] = @PurchasedQuantity
  ,[pcBrandID] = @pcBrandID
  ,[NoOfCPUs] = @NoOfCPUs
  ,[cpuBrandID] = @cpuBrandID
  ,[CPUModel] = @CPUModel
  ,[RamID] = @RamID
  ,[NoOfHDDs] = @NoOfHDDs
  ,[TotalHDDGB] = @TotalHDDGB
  ,[HDDDetails] = @HDDDetails
  ,[NoOfCDROMs] = @NoOfCDROMs
  ,[CDRomDetails] = @CDRomDetails
  ,[vduBrandID] = @vduBrandID
  ,[pcOSID] = @pcOSID
  ,[pcOSDetails] = @pcOSDetails
  ,[Remarks] = @Remarks
  WHERE
  [MrnID] = @Original_MrnID
  SET @RowCount = @@RowCount
GO
