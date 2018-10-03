USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spelogIRBLDetailsDelete]
  @Original_IRNo Int,
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [ELOG_IRBLDetails]
  WHERE
  [ELOG_IRBLDetails].[IRNo] = @Original_IRNo
  AND [ELOG_IRBLDetails].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
