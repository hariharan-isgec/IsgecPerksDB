USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLDetailsUpdate]
  @Original_BLID NVarChar(9), 
  @Original_SerialNo Int, 
  @BLID NVarChar(9),
  @SerialNo Int,
  @SizeAndTypeOfContainer NVarChar(50),
  @ContainerNumber NVarChar(50),
  @Remarks NVarChar(100),
  @RowCount int = null OUTPUT
  AS
  UPDATE [ELOG_BLDetails] SET 
   [BLID] = @BLID
  ,[SerialNo] = @SerialNo
  ,[SizeAndTypeOfContainer] = @SizeAndTypeOfContainer
  ,[ContainerNumber] = @ContainerNumber
  ,[Remarks] = @Remarks
  WHERE
  [BLID] = @Original_BLID
  AND [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
