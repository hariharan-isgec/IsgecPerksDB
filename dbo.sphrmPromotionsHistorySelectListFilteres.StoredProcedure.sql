USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsHistorySelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Executed Bit,
  @Cancelled Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  PromotionID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (PromotionID) ' + 
               'SELECT [HRM_Promotions].[PromotionID] FROM [HRM_Promotions] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Employees] AS [HRM_Employees1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Promotions].[CardNo] = [HRM_Employees1].[CardNo]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Designations] AS [HRM_Designations2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Promotions].[DesignationID] = [HRM_Designations2].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Promotions].[ProcessedBy] = [HRM_Employees3].[CardNo]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Promotions].[Executed] = ''' + CONVERT(NVarChar(10), @Executed) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Promotions].[Cancelled] = ''' + CONVERT(NVarChar(10), @Cancelled) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PromotionID' THEN '[HRM_Promotions].[PromotionID]'
                        WHEN 'PromotionID DESC' THEN '[HRM_Promotions].[PromotionID] DESC'
                        WHEN 'CardNo' THEN '[HRM_Promotions].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Promotions].[CardNo] DESC'
                        WHEN 'PromotionOn' THEN '[HRM_Promotions].[PromotionOn]'
                        WHEN 'PromotionOn DESC' THEN '[HRM_Promotions].[PromotionOn] DESC'
                        WHEN 'DesignationID' THEN '[HRM_Promotions].[DesignationID]'
                        WHEN 'DesignationID DESC' THEN '[HRM_Promotions].[DesignationID] DESC'
                        WHEN 'Remarks' THEN '[HRM_Promotions].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[HRM_Promotions].[Remarks] DESC'
                        WHEN 'Executed' THEN '[HRM_Promotions].[Executed]'
                        WHEN 'Executed DESC' THEN '[HRM_Promotions].[Executed] DESC'
                        WHEN 'Cancelled' THEN '[HRM_Promotions].[Cancelled]'
                        WHEN 'Cancelled DESC' THEN '[HRM_Promotions].[Cancelled] DESC'
                        WHEN 'ProcessedBy' THEN '[HRM_Promotions].[ProcessedBy]'
                        WHEN 'ProcessedBy DESC' THEN '[HRM_Promotions].[ProcessedBy] DESC'
                        WHEN 'ProcessedOn' THEN '[HRM_Promotions].[ProcessedOn]'
                        WHEN 'ProcessedOn DESC' THEN '[HRM_Promotions].[ProcessedOn] DESC'
                        WHEN 'HRM_Employees1_CardNo' THEN '[HRM_Employees1].[CardNo]'
                        WHEN 'HRM_Employees1_CardNo DESC' THEN '[HRM_Employees1].[CardNo] DESC'
                        WHEN 'HRM_Employees1_EmployeeName' THEN '[HRM_Employees1].[EmployeeName]'
                        WHEN 'HRM_Employees1_EmployeeName DESC' THEN '[HRM_Employees1].[EmployeeName] DESC'
                        WHEN 'HRM_Employees1_C_DateOfJoining' THEN '[HRM_Employees1].[C_DateOfJoining]'
                        WHEN 'HRM_Employees1_C_DateOfJoining DESC' THEN '[HRM_Employees1].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees1_C_CompanyID' THEN '[HRM_Employees1].[C_CompanyID]'
                        WHEN 'HRM_Employees1_C_CompanyID DESC' THEN '[HRM_Employees1].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees1_C_DivisionID' THEN '[HRM_Employees1].[C_DivisionID]'
                        WHEN 'HRM_Employees1_C_DivisionID DESC' THEN '[HRM_Employees1].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees1_C_OfficeID' THEN '[HRM_Employees1].[C_OfficeID]'
                        WHEN 'HRM_Employees1_C_OfficeID DESC' THEN '[HRM_Employees1].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees1_C_DepartmentID' THEN '[HRM_Employees1].[C_DepartmentID]'
                        WHEN 'HRM_Employees1_C_DepartmentID DESC' THEN '[HRM_Employees1].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees1_C_ProjectSiteID' THEN '[HRM_Employees1].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees1_C_ProjectSiteID DESC' THEN '[HRM_Employees1].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees1_C_DesignationID' THEN '[HRM_Employees1].[C_DesignationID]'
                        WHEN 'HRM_Employees1_C_DesignationID DESC' THEN '[HRM_Employees1].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees1_ActiveState' THEN '[HRM_Employees1].[ActiveState]'
                        WHEN 'HRM_Employees1_ActiveState DESC' THEN '[HRM_Employees1].[ActiveState] DESC'
                        WHEN 'HRM_Designations2_DesignationID' THEN '[HRM_Designations2].[DesignationID]'
                        WHEN 'HRM_Designations2_DesignationID DESC' THEN '[HRM_Designations2].[DesignationID] DESC'
                        WHEN 'HRM_Designations2_Description' THEN '[HRM_Designations2].[Description]'
                        WHEN 'HRM_Designations2_Description DESC' THEN '[HRM_Designations2].[Description] DESC'
                        WHEN 'HRM_Designations2_ShortName' THEN '[HRM_Designations2].[ShortName]'
                        WHEN 'HRM_Designations2_ShortName DESC' THEN '[HRM_Designations2].[ShortName] DESC'
                        WHEN 'HRM_Designations2_Sequence' THEN '[HRM_Designations2].[Sequence]'
                        WHEN 'HRM_Designations2_Sequence DESC' THEN '[HRM_Designations2].[Sequence] DESC'
                        WHEN 'HRM_Employees3_CardNo' THEN '[HRM_Employees3].[CardNo]'
                        WHEN 'HRM_Employees3_CardNo DESC' THEN '[HRM_Employees3].[CardNo] DESC'
                        WHEN 'HRM_Employees3_EmployeeName' THEN '[HRM_Employees3].[EmployeeName]'
                        WHEN 'HRM_Employees3_EmployeeName DESC' THEN '[HRM_Employees3].[EmployeeName] DESC'
                        WHEN 'HRM_Employees3_C_DateOfJoining' THEN '[HRM_Employees3].[C_DateOfJoining]'
                        WHEN 'HRM_Employees3_C_DateOfJoining DESC' THEN '[HRM_Employees3].[C_DateOfJoining] DESC'
                        WHEN 'HRM_Employees3_C_CompanyID' THEN '[HRM_Employees3].[C_CompanyID]'
                        WHEN 'HRM_Employees3_C_CompanyID DESC' THEN '[HRM_Employees3].[C_CompanyID] DESC'
                        WHEN 'HRM_Employees3_C_DivisionID' THEN '[HRM_Employees3].[C_DivisionID]'
                        WHEN 'HRM_Employees3_C_DivisionID DESC' THEN '[HRM_Employees3].[C_DivisionID] DESC'
                        WHEN 'HRM_Employees3_C_OfficeID' THEN '[HRM_Employees3].[C_OfficeID]'
                        WHEN 'HRM_Employees3_C_OfficeID DESC' THEN '[HRM_Employees3].[C_OfficeID] DESC'
                        WHEN 'HRM_Employees3_C_DepartmentID' THEN '[HRM_Employees3].[C_DepartmentID]'
                        WHEN 'HRM_Employees3_C_DepartmentID DESC' THEN '[HRM_Employees3].[C_DepartmentID] DESC'
                        WHEN 'HRM_Employees3_C_ProjectSiteID' THEN '[HRM_Employees3].[C_ProjectSiteID]'
                        WHEN 'HRM_Employees3_C_ProjectSiteID DESC' THEN '[HRM_Employees3].[C_ProjectSiteID] DESC'
                        WHEN 'HRM_Employees3_C_DesignationID' THEN '[HRM_Employees3].[C_DesignationID]'
                        WHEN 'HRM_Employees3_C_DesignationID DESC' THEN '[HRM_Employees3].[C_DesignationID] DESC'
                        WHEN 'HRM_Employees3_ActiveState' THEN '[HRM_Employees3].[ActiveState]'
                        WHEN 'HRM_Employees3_ActiveState DESC' THEN '[HRM_Employees3].[ActiveState] DESC'
                        ELSE '[HRM_Promotions].[PromotionID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Promotions].[PromotionID],
		[HRM_Promotions].[CardNo],
		[HRM_Promotions].[PromotionOn],
		[HRM_Promotions].[DesignationID],
		[HRM_Promotions].[Remarks],
		[HRM_Promotions].[Executed],
		[HRM_Promotions].[Cancelled],
		[HRM_Promotions].[ProcessedBy],
		[HRM_Promotions].[ProcessedOn],
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_ProjectSiteID] AS HRM_Employees1_C_ProjectSiteID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[HRM_Designations2].[DesignationID] AS HRM_Designations2_DesignationID,
		[HRM_Designations2].[Description] AS HRM_Designations2_Description,
		[HRM_Designations2].[ShortName] AS HRM_Designations2_ShortName,
		[HRM_Designations2].[Sequence] AS HRM_Designations2_Sequence,
		[HRM_Employees3].[CardNo] AS HRM_Employees3_CardNo,
		[HRM_Employees3].[EmployeeName] AS HRM_Employees3_EmployeeName,
		[HRM_Employees3].[C_DateOfJoining] AS HRM_Employees3_C_DateOfJoining,
		[HRM_Employees3].[C_CompanyID] AS HRM_Employees3_C_CompanyID,
		[HRM_Employees3].[C_DivisionID] AS HRM_Employees3_C_DivisionID,
		[HRM_Employees3].[C_OfficeID] AS HRM_Employees3_C_OfficeID,
		[HRM_Employees3].[C_DepartmentID] AS HRM_Employees3_C_DepartmentID,
		[HRM_Employees3].[C_ProjectSiteID] AS HRM_Employees3_C_ProjectSiteID,
		[HRM_Employees3].[C_DesignationID] AS HRM_Employees3_C_DesignationID,
		[HRM_Employees3].[ActiveState] AS HRM_Employees3_ActiveState 
  FROM [HRM_Promotions] 
    	INNER JOIN #PageIndex
          ON [HRM_Promotions].[PromotionID] = #PageIndex.PromotionID
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [HRM_Promotions].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [HRM_Designations] AS [HRM_Designations2]
    ON [HRM_Promotions].[DesignationID] = [HRM_Designations2].[DesignationID]
  LEFT OUTER JOIN [HRM_Employees] AS [HRM_Employees3]
    ON [HRM_Promotions].[ProcessedBy] = [HRM_Employees3].[CardNo]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
