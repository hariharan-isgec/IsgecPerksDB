USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnMonthsSelectByID]
  @MonthID NVarChar(3) 
  AS
  SELECT
		[ATN_Months].[MonthID],
		[ATN_Months].[ShortName],
		[ATN_Months].[Description] 
  FROM [ATN_Months] 
  WHERE
  [ATN_Months].[MonthID] = @MonthID
GO
