USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spspmtTranTypesDelete]
  @Original_TranTypeID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_TranTypes]
  WHERE
  [SPMT_TranTypes].[TranTypeID] = @Original_TranTypeID
  SET @RowCount = @@RowCount
GO
