USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPetrolRateSelectByID]
  @LoginID NVarChar(8),
  @FinYear Int,
  @MonthID Int,
  @LocationID Int 
  AS
  SELECT
    [PRK_PetrolRate].* ,
    [HRM_Locations1].[Description] AS HRM_Locations1_Description,
    [PRK_FinYears2].[Description] AS PRK_FinYears2_Description,
    [PRK_Months3].[MonthName] AS PRK_Months3_MonthName 
  FROM [PRK_PetrolRate] 
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [PRK_PetrolRate].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears2]
    ON [PRK_PetrolRate].[FinYear] = [PRK_FinYears2].[FinYear]
  INNER JOIN [PRK_Months] AS [PRK_Months3]
    ON [PRK_PetrolRate].[MonthID] = [PRK_Months3].[MonthID]
  WHERE
  [PRK_PetrolRate].[FinYear] = @FinYear
  AND [PRK_PetrolRate].[MonthID] = @MonthID
  AND [PRK_PetrolRate].[LocationID] = @LocationID
GO
