USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sptaBHDelete]
  @Original_TABillNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_Bills]
  WHERE
  [TA_Bills].[TABillNo] = @Original_TABillNo
  SET @RowCount = @@RowCount
GO
