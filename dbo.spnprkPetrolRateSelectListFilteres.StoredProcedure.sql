USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spnprkPetrolRateSelectListFilteres]
  @Filter_FinYear Int,
  @Filter_MonthID Int,
  @Filter_LocationID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear Int NOT NULL
 ,MonthID Int NOT NULL
 ,LocationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', MonthID'
  SET @LGSQL = @LGSQL + ', LocationID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PRK_PetrolRate].[FinYear]'
  SET @LGSQL = @LGSQL + ', [PRK_PetrolRate].[MonthID]'
  SET @LGSQL = @LGSQL + ', [PRK_PetrolRate].[LocationID]'
  SET @LGSQL = @LGSQL + ' FROM [PRK_PetrolRate] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Locations] AS [HRM_Locations1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_PetrolRate].[LocationID] = [HRM_Locations1].[LocationID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_FinYears] AS [PRK_FinYears2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_PetrolRate].[FinYear] = [PRK_FinYears2].[FinYear]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Months] AS [PRK_Months3]'
  SET @LGSQL = @LGSQL + '    ON [PRK_PetrolRate].[MonthID] = [PRK_Months3].[MonthID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_FinYear > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_PetrolRate].[FinYear] = ' + STR(@Filter_FinYear)
  IF (@Filter_MonthID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_PetrolRate].[MonthID] = ' + STR(@Filter_MonthID)
  IF (@Filter_LocationID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_PetrolRate].[LocationID] = ' + STR(@Filter_LocationID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PRK_PetrolRate].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_PetrolRate].[FinYear] DESC'
                        WHEN 'MonthID' THEN '[PRK_PetrolRate].[MonthID]'
                        WHEN 'MonthID DESC' THEN '[PRK_PetrolRate].[MonthID] DESC'
                        WHEN 'LocationID' THEN '[PRK_PetrolRate].[LocationID]'
                        WHEN 'LocationID DESC' THEN '[PRK_PetrolRate].[LocationID] DESC'
                        WHEN 'PetrolRate' THEN '[PRK_PetrolRate].[PetrolRate]'
                        WHEN 'PetrolRate DESC' THEN '[PRK_PetrolRate].[PetrolRate] DESC'
                        WHEN 'HRM_Locations1_Description' THEN '[HRM_Locations1].[Description]'
                        WHEN 'HRM_Locations1_Description DESC' THEN '[HRM_Locations1].[Description] DESC'
                        WHEN 'PRK_FinYears2_Description' THEN '[PRK_FinYears2].[Description]'
                        WHEN 'PRK_FinYears2_Description DESC' THEN '[PRK_FinYears2].[Description] DESC'
                        WHEN 'PRK_Months3_MonthName' THEN '[PRK_Months3].[MonthName]'
                        WHEN 'PRK_Months3_MonthName DESC' THEN '[PRK_Months3].[MonthName] DESC'
                        ELSE '[PRK_PetrolRate].[FinYear],[PRK_PetrolRate].[MonthID],[PRK_PetrolRate].[LocationID]'
                    END
  EXEC (@LGSQL)

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
