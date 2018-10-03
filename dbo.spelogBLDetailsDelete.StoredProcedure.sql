USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogBLDetailsDelete]
  @Original_BLID NVarChar(9),
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_BLDetails]
  WHERE
  [ELOG_BLDetails].[BLID] = @Original_BLID
  AND [ELOG_BLDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
