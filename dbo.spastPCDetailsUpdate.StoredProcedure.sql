USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCDetailsUpdate]
  @pcBrandID Int,
  @ModelNo NVarChar(50),
  @SerialNo NVarChar(50),
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
  @vduSerialNo NVarChar(50),
  @pcOSID Int,
  @pcOSDetails NVarChar(100),
  @IPAddress NVarChar(15),
  @HostName NVarChar(50),
  @INDomain Bit,
  @DomainName NVarChar(50),
  @pcUser NVarChar(50),
  @UserID Int,
  @MrnID Int,
  @AssetNo NVarChar(20),
  @LocationID Int,
  @MapDrive Bit,
  @PenDriveDisabled Bit,
  @CDRomDisabled Bit,
  @InternetAccess Bit,
  @Keyboard Bit,
  @Mouse Bit,
  @FloppyDrive Bit,
  @Remarks NVarChar(200),
  @Issued Bit,
  @Discarded Bit,
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_pcID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_PCDetails] SET 
   [pcBrandID] = @pcBrandID
  ,[ModelNo] = @ModelNo
  ,[SerialNo] = @SerialNo
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
  ,[vduSerialNo] = @vduSerialNo
  ,[pcOSID] = @pcOSID
  ,[pcOSDetails] = @pcOSDetails
  ,[IPAddress] = @IPAddress
  ,[HostName] = @HostName
  ,[INDomain] = @INDomain
  ,[DomainName] = @DomainName
  ,[pcUser] = @pcUser
  ,[UserID] = @UserID
  ,[MrnID] = @MrnID
  ,[AssetNo] = @AssetNo
  ,[LocationID] = @LocationID
  ,[MapDrive] = @MapDrive
  ,[PenDriveDisabled] = @PenDriveDisabled
  ,[CDRomDisabled] = @CDRomDisabled
  ,[InternetAccess] = @InternetAccess
  ,[Keyboard] = @Keyboard
  ,[Mouse] = @Mouse
  ,[FloppyDrive] = @FloppyDrive
  ,[Remarks] = @Remarks
  ,[Issued] = @Issued
  ,[Discarded] = @Discarded
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
