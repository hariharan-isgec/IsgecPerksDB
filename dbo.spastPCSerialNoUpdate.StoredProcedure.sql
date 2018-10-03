USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spastPCSerialNoUpdate]
  @SerialNo NVarChar(50),
  @AssetNo NVarChar(20),
  @ModifiedBy Int,
  @ModifiedOn DateTime,
  @Original_pcID Int, 
  @RowCount int = null OUTPUT
  AS
  UPDATE [AST_PCDetails] SET 
   [SerialNo] = @SerialNo
  ,[AssetNo] = @AssetNo
  ,[ModifiedBy] = @ModifiedBy
  ,[ModifiedOn] = @ModifiedOn
  WHERE
  [pcID] = @Original_pcID
  SET @RowCount = @@RowCount
GO
