USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCConfigurationInsert]
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
  @pcID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
  (
   [NoOfCPUs]
  ,[cpuBrandID]
  ,[CPUModel]
  ,[RamID]
  ,[NoOfHDDs]
  ,[TotalHDDGB]
  ,[HDDDetails]
  ,[NoOfCDROMs]
  ,[CDRomDetails]
  ,[vduBrandID]
  ,[vduSerialNo]
  ,[pcOSID]
  ,[pcOSDetails]
  ,[HostName]
  ,[INDomain]
  ,[DomainName]
  ,[MapDrive]
  ,[PenDriveDisabled]
  ,[CDRomDisabled]
  ,[InternetAccess]
  ,[Keyboard]
  ,[Mouse]
  ,[FloppyDrive]
  ,[Remarks]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @NoOfCPUs
  ,@cpuBrandID
  ,@CPUModel
  ,@RamID
  ,@NoOfHDDs
  ,@TotalHDDGB
  ,@HDDDetails
  ,@NoOfCDROMs
  ,@CDRomDetails
  ,@vduBrandID
  ,@vduSerialNo
  ,@pcOSID
  ,@pcOSDetails
  ,@HostName
  ,@INDomain
  ,@DomainName
  ,@MapDrive
  ,@PenDriveDisabled
  ,@CDRomDisabled
  ,@InternetAccess
  ,@Keyboard
  ,@Mouse
  ,@FloppyDrive
  ,@Remarks
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @pcID = Scope_Identity()
GO
