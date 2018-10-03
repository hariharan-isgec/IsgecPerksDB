USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnTranTypeDelete]
  @Original_TranType NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_TranType]
  WHERE
  [ATN_TranType].[TranType] = @Original_TranType
  SET @RowCount = @@RowCount
GO
