USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkMonthsSelectByID]
  @LoginID NVarChar(8),
  @MonthID Int 
  AS
  SELECT
    [PRK_Months].*  
  FROM [PRK_Months] 
  WHERE
  [PRK_Months].[MonthID] = @MonthID
GO
