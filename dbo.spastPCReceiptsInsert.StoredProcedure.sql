USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCReceiptsInsert]
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
  @MrnID Int = null OUTPUT
  AS
  INSERT [AST_MrnPC]
  (
   [MrnDescription]
  ,[DateOfPurchase]
  ,[WarrantyTill]
  ,[InsuranceTill]
  ,[SupplierID]
  ,[Keyboard]
  ,[Mouse]
  ,[FloppyDrive]
  ,[PurchasedQuantity]
  ,[pcBrandID]
  ,[NoOfCPUs]
  ,[cpuBrandID]
  ,[CPUModel]
  ,[RamID]
  ,[NoOfHDDs]
  ,[TotalHDDGB]
  ,[HDDDetails]
  ,[NoOfCDROMs]
  ,[CDRomDetails]
  ,[vduBrandID]
  ,[pcOSID]
  ,[pcOSDetails]
  ,[Remarks]
  )
  VALUES
  (
   @MrnDescription
  ,@DateOfPurchase
  ,@WarrantyTill
  ,@InsuranceTill
  ,@SupplierID
  ,@Keyboard
  ,@Mouse
  ,@FloppyDrive
  ,@PurchasedQuantity
  ,@pcBrandID
  ,@NoOfCPUs
  ,@cpuBrandID
  ,@CPUModel
  ,@RamID
  ,@NoOfHDDs
  ,@TotalHDDGB
  ,@HDDDetails
  ,@NoOfCDROMs
  ,@CDRomDetails
  ,@vduBrandID
  ,@pcOSID
  ,@pcOSDetails
  ,@Remarks
  )
  SET @MrnID = Scope_Identity()
GO
