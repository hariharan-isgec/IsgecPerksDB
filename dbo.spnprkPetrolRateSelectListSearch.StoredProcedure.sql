USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPetrolRateSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear Int NOT NULL
 ,MonthID Int NOT NULL
 ,LocationID Int NOT NULL
  )
  INSERT INTO #PageIndex (FinYear, MonthID, LocationID)
  SELECT [PRK_PetrolRate].[FinYear], [PRK_PetrolRate].[MonthID], [PRK_PetrolRate].[LocationID] FROM [PRK_PetrolRate]
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [PRK_PetrolRate].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears2]
    ON [PRK_PetrolRate].[FinYear] = [PRK_FinYears2].[FinYear]
  INNER JOIN [PRK_Months] AS [PRK_Months3]
    ON [PRK_PetrolRate].[MonthID] = [PRK_Months3].[MonthID]
 WHERE  
   ( 
         STR(ISNULL([PRK_PetrolRate].[FinYear], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_PetrolRate].[MonthID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_PetrolRate].[LocationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_PetrolRate].[PetrolRate], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'FinYear' THEN [PRK_PetrolRate].[FinYear] END,
     CASE @OrderBy WHEN 'FinYear DESC' THEN [PRK_PetrolRate].[FinYear] END DESC,
     CASE @OrderBy WHEN 'MonthID' THEN [PRK_PetrolRate].[MonthID] END,
     CASE @OrderBy WHEN 'MonthID DESC' THEN [PRK_PetrolRate].[MonthID] END DESC,
     CASE @OrderBy WHEN 'LocationID' THEN [PRK_PetrolRate].[LocationID] END,
     CASE @OrderBy WHEN 'LocationID DESC' THEN [PRK_PetrolRate].[LocationID] END DESC,
     CASE @OrderBy WHEN 'PetrolRate' THEN [PRK_PetrolRate].[PetrolRate] END,
     CASE @OrderBy WHEN 'PetrolRate DESC' THEN [PRK_PetrolRate].[PetrolRate] END DESC,
     CASE @OrderBy WHEN 'HRM_Locations1_Description' THEN [HRM_Locations1].[Description] END,
     CASE @OrderBy WHEN 'HRM_Locations1_Description DESC' THEN [HRM_Locations1].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_FinYears2_Description' THEN [PRK_FinYears2].[Description] END,
     CASE @OrderBy WHEN 'PRK_FinYears2_Description DESC' THEN [PRK_FinYears2].[Description] END DESC,
     CASE @OrderBy WHEN 'PRK_Months3_MonthName' THEN [PRK_Months3].[MonthName] END,
     CASE @OrderBy WHEN 'PRK_Months3_MonthName DESC' THEN [PRK_Months3].[MonthName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
    [PRK_PetrolRate].* ,
    [HRM_Locations1].[Description] AS HRM_Locations1_Description,
    [PRK_FinYears2].[Description] AS PRK_FinYears2_Description,
    [PRK_Months3].[MonthName] AS PRK_Months3_MonthName 
  FROM [PRK_PetrolRate] 
      INNER JOIN #PageIndex
          ON [PRK_PetrolRate].[FinYear] = #PageIndex.FinYear
          AND [PRK_PetrolRate].[MonthID] = #PageIndex.MonthID
          AND [PRK_PetrolRate].[LocationID] = #PageIndex.LocationID
  INNER JOIN [HRM_Locations] AS [HRM_Locations1]
    ON [PRK_PetrolRate].[LocationID] = [HRM_Locations1].[LocationID]
  INNER JOIN [PRK_FinYears] AS [PRK_FinYears2]
    ON [PRK_PetrolRate].[FinYear] = [PRK_FinYears2].[FinYear]
  INNER JOIN [PRK_Months] AS [PRK_Months3]
    ON [PRK_PetrolRate].[MonthID] = [PRK_Months3].[MonthID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
