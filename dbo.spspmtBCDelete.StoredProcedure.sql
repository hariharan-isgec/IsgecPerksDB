USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spspmtBCDelete]
  @Original_BCID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [SPMT_BC]
  WHERE
  [SPMT_BC].[BCID] = @Original_BCID
  SET @RowCount = @@RowCount
GO
