USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spcostFinYearSelectByID]
  @LoginID NVarChar(8),
  @FinYear Int 
  AS
  SELECT
    [COST_FinYear].*  
  FROM [COST_FinYear] 
  WHERE
  [COST_FinYear].[FinYear] = @FinYear
GO
