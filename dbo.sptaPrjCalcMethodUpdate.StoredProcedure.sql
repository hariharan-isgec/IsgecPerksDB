USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaPrjCalcMethodUpdate]
  @Original_ProjectCalcID Int, 
  @Description NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [TA_PrjCalcMethod] SET 
   [Description] = @Description
  WHERE
  [ProjectCalcID] = @Original_ProjectCalcID
  SET @RowCount = @@RowCount
GO
