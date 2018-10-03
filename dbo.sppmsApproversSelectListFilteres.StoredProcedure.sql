USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sppmsApproversSelectListFilteres]
  @Filter_CardNo NVarChar(8),
  @Filter_Apparaiser NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @FinYear NVarChar(4),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,FinYear NVarChar(4) NOT NULL
 ,CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'FinYear'
  SET @LGSQL = @LGSQL + ', CardNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[PMS_Approvers].[FinYear]'
  SET @LGSQL = @LGSQL + ', [PMS_Approvers].[CardNo]'
  SET @LGSQL = @LGSQL + ' FROM [PMS_Approvers] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [PMS_Approvers].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]'
  SET @LGSQL = @LGSQL + '    ON [PMS_Approvers].[Apparaiser] = [HRM_Employees2].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [PMS_Approvers].[ReviewerI] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]'
  SET @LGSQL = @LGSQL + '    ON [PMS_Approvers].[ReviewerII] = [HRM_Employees4].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [PMS_FinYear] AS [PMS_FinYear5]'
  SET @LGSQL = @LGSQL + '    ON [PMS_Approvers].[FinYear] = [PMS_FinYear5].[FinYear]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [PMS_Approvers].[FinYear] = (''' + @FinYear + ''')'
  IF (@Filter_CardNo > '') 
    SET @LGSQL = @LGSQL + ' AND [PMS_Approvers].[CardNo] = ''' + @Filter_CardNo + ''''
  IF (@Filter_Apparaiser > '') 
    SET @LGSQL = @LGSQL + ' AND [PMS_Approvers].[Apparaiser] = ''' + @Filter_Apparaiser + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'FinYear' THEN '[PMS_Approvers].[FinYear]'
                        WHEN 'FinYear DESC' THEN '[PMS_Approvers].[FinYear] DESC'
                        WHEN 'CardNo' THEN '[PMS_Approvers].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[PMS_Approvers].[CardNo] DESC'
                        WHEN 'Apparaiser' THEN '[PMS_Approvers].[Apparaiser]'
                        WHEN 'Apparaiser DESC' THEN '[PMS_Approvers].[Apparaiser] DESC'
                        WHEN 'ReviewerI' THEN '[PMS_Approvers].[ReviewerI]'
                        WHEN 'ReviewerI DESC' THEN '[PMS_Approvers].[ReviewerI] DESC'
                        WHEN 'ReviewerII' THEN '[PMS_Approvers].[ReviewerII]'
                        WHEN 'ReviewerII DESC' THEN '[PMS_Approvers].[ReviewerII] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees2_EmployeeName' THEN '[HRM_Employees2].[EmployeeName]'
                        WHEN 'HRM_Employees2_EmployeeName DESC' THEN '[HRM_Employees2].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'HRM_Employees4_EmployeeName' THEN '[HRM_Employees4].[EmployeeName]'
                        WHEN 'HRM_Employees4_EmployeeName DESC' THEN '[HRM_Employees4].[EmployeeName] DESC'
                        WHEN 'PMS_FinYear5_Description' THEN '[PMS_FinYear5].[Description]'
                        WHEN 'PMS_FinYear5_Description DESC' THEN '[PMS_FinYear5].[Description] DESC'
                        ELSE '[PMS_Approvers].[FinYear],[PMS_Approvers].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[PMS_Approvers].[FinYear] ,
		[PMS_Approvers].[CardNo] ,
		[PMS_Approvers].[Apparaiser] ,
		[PMS_Approvers].[ReviewerI] ,
		[PMS_Approvers].[ReviewerII] ,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees2].[EmployeeName] AS HRM_Employees2_EmployeeName,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees4].[EmployeeName] AS HRM_Employees4_EmployeeName,
		[PMS_FinYear5].[Description] AS PMS_FinYear5_Description 
  FROM [PMS_Approvers] 
    	INNER JOIN #PageIndex
          ON [PMS_Approvers].[FinYear] = #PageIndex.FinYear
          AND [PMS_Approvers].[CardNo] = #PageIndex.CardNo
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [PMS_Approvers].[CardNo] = [HRM_Employees1].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees2]
    ON [PMS_Approvers].[Apparaiser] = [HRM_Employees2].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [PMS_Approvers].[ReviewerI] = [HRM_Employees3].[CardNo]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees4]
    ON [PMS_Approvers].[ReviewerII] = [HRM_Employees4].[CardNo]
  INNER JOIN [PMS_FinYear] AS [PMS_FinYear5]
    ON [PMS_Approvers].[FinYear] = [PMS_FinYear5].[FinYear]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
