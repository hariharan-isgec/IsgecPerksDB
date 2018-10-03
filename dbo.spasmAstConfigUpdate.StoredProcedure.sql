USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstConfigUpdate]
  @Original_MrnID Int, 
  @Original_AssetID Int, 
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @CPUBrandID NVarChar(15),
  @NoOfCPUs Int,
  @CPUDetails NVarChar(50),
  @CPUSerialNo NVarChar(100),
  @RAMID NVarChar(10),
  @SizeOfRAM Int,
  @HDDBrandID NVarChar(15),
  @NoOfHDD Int,
  @SizeOfHDD Int,
  @HDDDetails NVarChar(50),
  @HDDSerialNo NVarChar(100),
  @CDROMBrandID NVarChar(15),
  @NoOfCDROM Int,
  @CDROMDetails NVarChar(50),
  @CDROMSerialNo NVarChar(100),
  @VDUBrandID NVarChar(15),
  @VDUDetails NVarChar(50),
  @VDUSerialNo NVarChar(100),
  @PCOSID NVarChar(15),
  @PCOSDetails NVarChar(50),
  @PCOSSerialNo NVarChar(100),
  @OtherSpecifications NVarChar(50),
  @ModificationRemarks NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstDetails] SET 
   [Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[CPUBrandID] = @CPUBrandID
  ,[NoOfCPUs] = @NoOfCPUs
  ,[CPUDetails] = @CPUDetails
  ,[CPUSerialNo] = @CPUSerialNo
  ,[RAMID] = @RAMID
  ,[SizeOfRAM] = @SizeOfRAM
  ,[HDDBrandID] = @HDDBrandID
  ,[NoOfHDD] = @NoOfHDD
  ,[SizeOfHDD] = @SizeOfHDD
  ,[HDDDetails] = @HDDDetails
  ,[HDDSerialNo] = @HDDSerialNo
  ,[CDROMBrandID] = @CDROMBrandID
  ,[NoOfCDROM] = @NoOfCDROM
  ,[CDROMDetails] = @CDROMDetails
  ,[CDROMSerialNo] = @CDROMSerialNo
  ,[VDUBrandID] = @VDUBrandID
  ,[VDUDetails] = @VDUDetails
  ,[VDUSerialNo] = @VDUSerialNo
  ,[PCOSID] = @PCOSID
  ,[PCOSDetails] = @PCOSDetails
  ,[PCOSSerialNo] = @PCOSSerialNo
  ,[OtherSpecifications] = @OtherSpecifications
  ,[ModificationRemarks] = @ModificationRemarks
  WHERE
  [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
