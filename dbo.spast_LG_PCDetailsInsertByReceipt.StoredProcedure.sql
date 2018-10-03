USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spast_LG_PCDetailsInsertByReceipt]
  @MrnID Int,
  @Keyboard Bit,
  @Mouse Bit,
  @FloppyDrive Bit,
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
  @PCID Int = null OUTPUT
  AS
  INSERT [AST_PCDetails]
  (
   [MrnID]
  ,[Keyboard]
  ,[Mouse]
  ,[FloppyDrive]
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
   @MrnID
  ,@Keyboard
  ,@Mouse
  ,@FloppyDrive
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
  SET @PCID = Scope_Identity()
GO
