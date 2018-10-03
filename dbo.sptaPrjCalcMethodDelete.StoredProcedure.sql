USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodDelete]
  @Original_ProjectCalcID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_PrjCalcMethod]
  WHERE
  [TA_PrjCalcMethod].[ProjectCalcID] = @Original_ProjectCalcID
  SET @RowCount = @@RowCount
GO
