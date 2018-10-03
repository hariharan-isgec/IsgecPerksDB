USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMonthsUpdate]
  @Original_MonthID Int, 
  @MonthID Int,
  @MonthName NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  UPDATE [PRK_Months] SET 
   [MonthID] = @MonthID
  ,[MonthName] = @MonthName
  WHERE
  [MonthID] = @Original_MonthID
  SET @RowCount = @@RowCount
GO
