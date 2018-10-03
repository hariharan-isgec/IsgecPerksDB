USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearDelete]
  @Original_FinYear Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [COST_FinYear]
  WHERE
  [COST_FinYear].[FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO
