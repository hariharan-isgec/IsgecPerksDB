USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkFinYearSelectByID]
  @FinYear Int
  AS
  SELECT
		[PRK_FinYears].[FinYear],
		[PRK_FinYears].[Description],
		[PRK_FinYears].[StartDate],
		[PRK_FinYears].[EndDate],
		[PRK_FinYears].[Status] 
  FROM [PRK_FinYears] 
  WHERE
  [PRK_FinYears].[FinYear] = @FinYear
GO
