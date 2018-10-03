USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrkChangePaymentMethodSelectListFilteres]
  @Filter_EmployeeID Int,
  @Filter_PerkID Int,
  @StartRowIndex int,
  @MaximumRows int,
  @StatusID Int,
  @FinYear Int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  ApplicationID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (ApplicationID) ' + 
               'SELECT [PRK_Applications].[ApplicationID] FROM [PRK_Applications] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Employees] AS [PRK_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[EmployeeID] = [PRK_Employees1].[EmployeeID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PRK_Perks] AS [PRK_Perks2]'
  SET @LGSQL = @LGSQL + '    ON [PRK_Applications].[PerkID] = [PRK_Perks2].[PerkID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_EmployeeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[EmployeeID] = ' + STR(@Filter_EmployeeID)
  IF (@Filter_PerkID > 0) 
    SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[PerkID] = ' + STR(@Filter_PerkID)
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[StatusID] = ' + STR(@StatusID)
  SET @LGSQL = @LGSQL + ' AND [PRK_Applications].[FinYear] = ' + STR(@FinYear)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'ApplicationID' THEN '[PRK_Applications].[ApplicationID]'
                        WHEN 'ApplicationID DESC' THEN '[PRK_Applications].[ApplicationID] DESC'
                        WHEN 'EmployeeID' THEN '[PRK_Applications].[EmployeeID]'
                        WHEN 'EmployeeID DESC' THEN '[PRK_Applications].[EmployeeID] DESC'
                        WHEN 'PerkID' THEN '[PRK_Applications].[PerkID]'
                        WHEN 'PerkID DESC' THEN '[PRK_Applications].[PerkID] DESC'
                        WHEN 'AppliedOn' THEN '[PRK_Applications].[AppliedOn]'
                        WHEN 'AppliedOn DESC' THEN '[PRK_Applications].[AppliedOn] DESC'
                        WHEN 'Value' THEN '[PRK_Applications].[Value]'
                        WHEN 'Value DESC' THEN '[PRK_Applications].[Value] DESC'
                        WHEN 'ApprovedAmt' THEN '[PRK_Applications].[ApprovedAmt]'
                        WHEN 'ApprovedAmt DESC' THEN '[PRK_Applications].[ApprovedAmt] DESC'
                        WHEN 'PaymentMethod' THEN '[PRK_Applications].[PaymentMethod]'
                        WHEN 'PaymentMethod DESC' THEN '[PRK_Applications].[PaymentMethod] DESC'
                        WHEN 'StatusID' THEN '[PRK_Applications].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[PRK_Applications].[StatusID] DESC'
                        WHEN 'FinYear' THEN '[PRK_Applications].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PRK_Applications].[FinYear] DESC'
                        WHEN 'PRK_Employees1_EmployeeID' THEN '[PRK_Employees1].[EmployeeID]'
                        WHEN 'PRK_Employees1_EmployeeID DESC' THEN '[PRK_Employees1].[EmployeeID] DESC'
                        WHEN 'PRK_Employees1_CardNo' THEN '[PRK_Employees1].[CardNo]'
                        WHEN 'PRK_Employees1_CardNo DESC' THEN '[PRK_Employees1].[CardNo] DESC'
                        WHEN 'PRK_Employees1_EmployeeName' THEN '[PRK_Employees1].[EmployeeName]'
                        WHEN 'PRK_Employees1_EmployeeName DESC' THEN '[PRK_Employees1].[EmployeeName] DESC'
                        WHEN 'PRK_Perks2_PerkID' THEN '[PRK_Perks2].[PerkID]'
                        WHEN 'PRK_Perks2_PerkID DESC' THEN '[PRK_Perks2].[PerkID] DESC'
                        WHEN 'PRK_Perks2_PerkCode' THEN '[PRK_Perks2].[PerkCode]'
                        WHEN 'PRK_Perks2_PerkCode DESC' THEN '[PRK_Perks2].[PerkCode] DESC'
                        WHEN 'PRK_Perks2_Description' THEN '[PRK_Perks2].[Description]'
                        WHEN 'PRK_Perks2_Description DESC' THEN '[PRK_Perks2].[Description] DESC'
                        ELSE '[PRK_Applications].[ApplicationID]'
                    END
  EXEC (@LGSQL)

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
