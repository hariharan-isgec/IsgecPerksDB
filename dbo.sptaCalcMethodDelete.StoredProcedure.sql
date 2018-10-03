USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sptaCalcMethodDelete]
  @Original_CalculationTypeID NVarChar(10),
  @RowCount int = null OUTPUT
  AS
  DELETE [TA_CalcMethod]
  WHERE
  [TA_CalcMethod].[CalculationTypeID] = @Original_CalculationTypeID
  SET @RowCount = @@RowCount
GO
