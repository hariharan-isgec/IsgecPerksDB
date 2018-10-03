USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spatnFinYearSelectByID]
  @FinYear NVarChar(4)
  AS
  SELECT
		[ATN_FinYear].[FinYear],
		[ATN_FinYear].[Description],
		[ATN_FinYear].[StartDate],
		[ATN_FinYear].[EndDate],
		[ATN_FinYear].[Active] 
  FROM [ATN_FinYear] 
  WHERE
  [ATN_FinYear].[FinYear] = @FinYear
GO
