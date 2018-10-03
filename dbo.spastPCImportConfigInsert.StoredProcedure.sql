USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCImportConfigInsert]
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
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @pcID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
  (
   [pcBrandID]
  ,[ModelNo]
  ,[SerialNo]
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
  ,[vduSerialNo]
  ,[pcOSID]
  ,[pcOSDetails]
  ,[IPAddress]
  ,[HostName]
  ,[INDomain]
  ,[DomainName]
  ,[pcUser]
  ,[UserID]
  ,[MrnID]
  ,[AssetNo]
  ,[LocationID]
  ,[MapDrive]
  ,[PenDriveDisabled]
  ,[CDRomDisabled]
  ,[InternetAccess]
  ,[Keyboard]
  ,[Mouse]
  ,[FloppyDrive]
  ,[ModifiedBy]
  ,[ModifiedOn]
  )
  VALUES
  (
   @pcBrandID
  ,@ModelNo
  ,@SerialNo
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
  ,@vduSerialNo
  ,@pcOSID
  ,@pcOSDetails
  ,@IPAddress
  ,@HostName
  ,@INDomain
  ,@DomainName
  ,@pcUser
  ,@UserID
  ,@MrnID
  ,@AssetNo
  ,@LocationID
  ,@MapDrive
  ,@PenDriveDisabled
  ,@CDRomDisabled
  ,@InternetAccess
  ,@Keyboard
  ,@Mouse
  ,@FloppyDrive
  ,@ModifiedBy
  ,@ModifiedOn
  )
  SET @pcID = Scope_Identity()
GO
