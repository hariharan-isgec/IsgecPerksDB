USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSYS_SearchPrkEmployees]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  EmployeeID Int NOT NULL
  )
  INSERT INTO #PageIndex (EmployeeID)
  SELECT [PRK_Employees].[EmployeeID] FROM [PRK_Employees]
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  WHERE STR(ISNULL([PRK_Employees].[EmployeeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories1].[CategoryCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Categories1].[STDCategory],'')) LIKE @KeyWord1

    SET @RecordCount = @@RowCount

  SELECT
  [PRK_Employees].[EmployeeID] AS SearchCode, 
  ISNULL([PRK_Employees].[CardNo],'') 
  + ',' + ISNULL([PRK_Employees].[EmployeeName],'') 
  + ',' + STR(ISNULL([PRK_Employees].[CategoryID],0)) 
  + ',' + ISNULL([PRK_Employees].[PostedAt],'') 
  + ',' + ISNULL([PRK_Employees].[VehicleType],'') 
  + ',' + STR(ISNULL([PRK_Employees].[Basic],0)) 
  + ',' + ISNULL([PRK_Employees].[Department],'') 
  + ',' + ISNULL([PRK_Employees].[Company],'') 
  + ',' + ISNULL([PRK_Categories1].[CategoryCode],'') 
  + ',' + ISNULL([PRK_Categories1].[Description],'') 
  + ',' + ISNULL([PRK_Categories1].[STDCategory],'') 
  AS SearchDescription 
  FROM [PRK_Employees] 
    	INNER JOIN #PageIndex
          ON [PRK_Employees].[EmployeeID] = #PageIndex.EmployeeID
  INNER JOIN [PRK_Categories] AS [PRK_Categories1]
    ON [PRK_Employees].[CategoryID] = [PRK_Categories1].[CategoryID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
