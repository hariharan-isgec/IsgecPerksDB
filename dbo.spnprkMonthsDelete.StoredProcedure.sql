USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMonthsDelete]
  @Original_MonthID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [PRK_Months]
  WHERE
  [PRK_Months].[MonthID] = @Original_MonthID
  SET @RowCount = @@RowCount
GO
