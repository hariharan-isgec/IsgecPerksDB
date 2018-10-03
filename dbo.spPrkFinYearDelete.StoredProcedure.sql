USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkFinYearDelete]
  @Original_FinYear Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_FinYears]
  WHERE
  [PRK_FinYears].[FinYear] = @Original_FinYear
  SET @RowCount = @@RowCount
GO
