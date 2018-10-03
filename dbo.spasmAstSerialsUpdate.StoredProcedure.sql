USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spasmAstSerialsUpdate]
  @Original_MrnID Int, 
  @Original_AssetID Int, 
  @AssetNo NVarChar(50),
  @AssetSerialNo NVarChar(50),
  @Modified Bit,
  @ModifiedOn DateTime,
  @ModifiedBy NVarChar(8),
  @CPUSerialNo NVarChar(100),
  @HDDSerialNo NVarChar(100),
  @CDROMSerialNo NVarChar(100),
  @VDUSerialNo NVarChar(100),
  @PCOSSerialNo NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ASM_AstDetails] SET 
   [AssetNo] = @AssetNo
  ,[AssetSerialNo] = @AssetSerialNo
  ,[Modified] = @Modified
  ,[ModifiedOn] = @ModifiedOn
  ,[ModifiedBy] = @ModifiedBy
  ,[CPUSerialNo] = @CPUSerialNo
  ,[HDDSerialNo] = @HDDSerialNo
  ,[CDROMSerialNo] = @CDROMSerialNo
  ,[VDUSerialNo] = @VDUSerialNo
  ,[PCOSSerialNo] = @PCOSSerialNo
  WHERE
  [MrnID] = @Original_MrnID
  AND [AssetID] = @Original_AssetID
  SET @RowCount = @@RowCount
GO
