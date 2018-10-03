USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkFinYearsSelectByID]
  @LoginID NVarChar(8),
  @FinYear Int 
  AS
  SELECT
    [PRK_FinYears].*  
  FROM [PRK_FinYears] 
  WHERE
  [PRK_FinYears].[FinYear] = @FinYear
GO
