USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkChangePaymentMethodSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @StatusID Int,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplicationID Int NOT NULL
  )
  INSERT INTO #PageIndex (ApplicationID)
  SELECT [PRK_Applications].[ApplicationID] FROM [PRK_Applications]
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
 WHERE  
      [PRK_Applications].[StatusID] = @StatusID
  AND [PRK_Applications].[FinYear] = @FinYear
   AND ( 
         STR(ISNULL([PRK_Applications].[ApplicationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[EmployeeID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[PerkID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[Value], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[ApprovedAmt], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Applications].[PaymentMethod],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Applications].[FinYear], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[EmployeeName],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees1].[CategoryID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[PostedAt],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[VehicleType],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Employees1].[Basic], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[Department],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Employees1].[Company],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[PerkCode],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks2].[AdvanceMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks2].[LockedMonths], 0)) LIKE @KeyWord1
     OR STR(ISNULL([PRK_Perks2].[NoOfPayments], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[UOM],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[BaaNGL],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([PRK_Perks2].[BaaNReference],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'ApplicationID' THEN [PRK_Applications].[ApplicationID] END,
     CASE @orderBy WHEN 'ApplicationID DESC' THEN [PRK_Applications].[ApplicationID] END DESC,
     CASE @orderBy WHEN 'EmployeeID' THEN [PRK_Applications].[EmployeeID] END,
     CASE @orderBy WHEN 'EmployeeID DESC' THEN [PRK_Applications].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PerkID' THEN [PRK_Applications].[PerkID] END,
     CASE @orderBy WHEN 'PerkID DESC' THEN [PRK_Applications].[PerkID] END DESC,
     CASE @orderBy WHEN 'AppliedOn' THEN [PRK_Applications].[AppliedOn] END,
     CASE @orderBy WHEN 'AppliedOn DESC' THEN [PRK_Applications].[AppliedOn] END DESC,
     CASE @orderBy WHEN 'Value' THEN [PRK_Applications].[Value] END,
     CASE @orderBy WHEN 'Value DESC' THEN [PRK_Applications].[Value] END DESC,
     CASE @orderBy WHEN 'ApprovedAmt' THEN [PRK_Applications].[ApprovedAmt] END,
     CASE @orderBy WHEN 'ApprovedAmt DESC' THEN [PRK_Applications].[ApprovedAmt] END DESC,
     CASE @orderBy WHEN 'PaymentMethod' THEN [PRK_Applications].[PaymentMethod] END,
     CASE @orderBy WHEN 'PaymentMethod DESC' THEN [PRK_Applications].[PaymentMethod] END DESC,
     CASE @orderBy WHEN 'StatusID' THEN [PRK_Applications].[StatusID] END,
     CASE @orderBy WHEN 'StatusID DESC' THEN [PRK_Applications].[StatusID] END DESC,
     CASE @orderBy WHEN 'FinYear' THEN [PRK_Applications].[FinYear] END,
     CASE @orderBy WHEN 'FinYear DESC' THEN [PRK_Applications].[FinYear] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeID' THEN [PRK_Employees1].[EmployeeID] END,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeID DESC' THEN [PRK_Employees1].[EmployeeID] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_CardNo' THEN [PRK_Employees1].[CardNo] END,
     CASE @orderBy WHEN 'PRK_Employees1_CardNo DESC' THEN [PRK_Employees1].[CardNo] END DESC,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeName' THEN [PRK_Employees1].[EmployeeName] END,
     CASE @orderBy WHEN 'PRK_Employees1_EmployeeName DESC' THEN [PRK_Employees1].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_PerkID' THEN [PRK_Perks2].[PerkID] END,
     CASE @orderBy WHEN 'PRK_Perks2_PerkID DESC' THEN [PRK_Perks2].[PerkID] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_PerkCode' THEN [PRK_Perks2].[PerkCode] END,
     CASE @orderBy WHEN 'PRK_Perks2_PerkCode DESC' THEN [PRK_Perks2].[PerkCode] END DESC,
     CASE @orderBy WHEN 'PRK_Perks2_Description' THEN [PRK_Perks2].[Description] END,
     CASE @orderBy WHEN 'PRK_Perks2_Description DESC' THEN [PRK_Perks2].[Description] END DESC

    SET @RecordCount = @@RowCount

  SELECT
		[PRK_Applications].[ApplicationID],
		[PRK_Applications].[EmployeeID],
		[PRK_Applications].[PerkID],
		[PRK_Applications].[AppliedOn],
		[PRK_Applications].[Value],
		[PRK_Applications].[ApprovedAmt],
		[PRK_Applications].[PaymentMethod],
		[PRK_Applications].[StatusID],
		[PRK_Applications].[FinYear],
		[PRK_Employees1].[EmployeeID] AS PRK_Employees1_EmployeeID,
		[PRK_Employees1].[CardNo] AS PRK_Employees1_CardNo,
		[PRK_Employees1].[EmployeeName] AS PRK_Employees1_EmployeeName,
		[PRK_Perks2].[PerkID] AS PRK_Perks2_PerkID,
		[PRK_Perks2].[PerkCode] AS PRK_Perks2_PerkCode,
		[PRK_Perks2].[Description] AS PRK_Perks2_Description
  FROM [PRK_Applications] 
   INNER JOIN #PageIndex
     ON [PRK_Applications].[ApplicationID] = #PageIndex.ApplicationID
  INNER JOIN [PRK_Employees] AS [PRK_Employees1]
    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]
  INNER JOIN [PRK_Perks] AS [PRK_Perks2]
    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
