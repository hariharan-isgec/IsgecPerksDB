USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMonthsDelete]
  @Original_MonthID NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  DELETE [ATN_Months]
  WHERE
  [ATN_Months].[MonthID] = @Original_MonthID
  SET @RowCount = @@RowCount
GO
