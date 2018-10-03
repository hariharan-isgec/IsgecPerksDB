USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCConfigurationUpdate]
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
  @HostName NVarChar(50),
  @INDomain Bit,
  @DomainName NVarChar(50),
  @MapDrive Bit,
  @PenDriveDisabled Bit,
  @CDRomDisabled Bit,
  @InternetAccess Bit,
  @Keyboard Bit,
  @Mouse Bit,
  @FloppyDrive Bit,
  @Remarks NVarChar(200),
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_pcID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_PCDetails] SET 
   [NoOfCPUs] = @NoOfCPUs
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
  ,[HostName] = @HostName
  ,[INDomain] = @INDomain
  ,[DomainName] = @DomainName
  ,[MapDrive] = @MapDrive
  ,[PenDriveDisabled] = @PenDriveDisabled
  ,[CDRomDisabled] = @CDRomDisabled
  ,[InternetAccess] = @InternetAccess
  ,[Keyboard] = @Keyboard
  ,[Mouse] = @Mouse
  ,[FloppyDrive] = @FloppyDrive
  ,[Remarks] = @Remarks
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
