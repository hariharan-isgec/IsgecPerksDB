USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @U_UnderPromotion Bit,
  @Resigned Bit,
  @ActiveState Bit,
  @Confirmed Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (CardNo) ' + 
               'SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments1].[DepartmentID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations2]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations2].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations3].[DesignationID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[U_UnderPromotion] = ''' + CONVERT(NVarChar(10), @U_UnderPromotion) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Resigned] = ''' + CONVERT(NVarChar(10), @Resigned) + ''''
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ''' + CONVERT(NVarChar(10), @ActiveState) + ''''
  --SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Confirmed] = ''' + CONVERT(NVarChar(10), @Confirmed) + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'C_DateOfJoining' THEN '[HRM_Employees].[C_DateOfJoining]'
                        WHEN 'C_DateOfJoining DESC' THEN '[HRM_Employees].[C_DateOfJoining] DESC'
                        WHEN 'C_DepartmentID' THEN '[HRM_Employees].[C_DepartmentID]'
                        WHEN 'C_DepartmentID DESC' THEN '[HRM_Employees].[C_DepartmentID] DESC'
                        WHEN 'C_DesignationID' THEN '[HRM_Employees].[C_DesignationID]'
                        WHEN 'C_DesignationID DESC' THEN '[HRM_Employees].[C_DesignationID] DESC'
                        WHEN 'U_UnderPromotion' THEN '[HRM_Employees].[U_UnderPromotion]'
                        WHEN 'U_UnderPromotion DESC' THEN '[HRM_Employees].[U_UnderPromotion] DESC'
                        WHEN 'U_NewDesignationID' THEN '[HRM_Employees].[U_NewDesignationID]'
                        WHEN 'U_NewDesignationID DESC' THEN '[HRM_Employees].[U_NewDesignationID] DESC'
                        WHEN 'C_PromotionOn' THEN '[HRM_Employees].[C_PromotionOn]'
                        WHEN 'C_PromotionOn DESC' THEN '[HRM_Employees].[C_PromotionOn] DESC'
                        WHEN 'C_PromotionRemark' THEN '[HRM_Employees].[C_PromotionRemark]'
                        WHEN 'C_PromotionRemark DESC' THEN '[HRM_Employees].[C_PromotionRemark] DESC'
                        WHEN 'Resigned' THEN '[HRM_Employees].[Resigned]'
                        WHEN 'Resigned DESC' THEN '[HRM_Employees].[Resigned] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'Confirmed' THEN '[HRM_Employees].[Confirmed]'
                        WHEN 'Confirmed DESC' THEN '[HRM_Employees].[Confirmed] DESC'
                        WHEN 'ModifiedEvent' THEN '[HRM_Employees].[ModifiedEvent]'
                        WHEN 'ModifiedEvent DESC' THEN '[HRM_Employees].[ModifiedEvent] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'HRM_Departments1_DepartmentID' THEN '[HRM_Departments1].[DepartmentID]'
                        WHEN 'HRM_Departments1_DepartmentID DESC' THEN '[HRM_Departments1].[DepartmentID] DESC'
                        WHEN 'HRM_Departments1_Description' THEN '[HRM_Departments1].[Description]'
                        WHEN 'HRM_Departments1_Description DESC' THEN '[HRM_Departments1].[Description] DESC'
                        WHEN 'HRM_Designations2_DesignationID' THEN '[HRM_Designations2].[DesignationID]'
                        WHEN 'HRM_Designations2_DesignationID DESC' THEN '[HRM_Designations2].[DesignationID] DESC'
                        WHEN 'HRM_Designations2_Description' THEN '[HRM_Designations2].[Description]'
                        WHEN 'HRM_Designations2_Description DESC' THEN '[HRM_Designations2].[Description] DESC'
                        WHEN 'HRM_Designations2_ShortName' THEN '[HRM_Designations2].[ShortName]'
                        WHEN 'HRM_Designations2_ShortName DESC' THEN '[HRM_Designations2].[ShortName] DESC'
                        WHEN 'HRM_Designations2_Sequence' THEN '[HRM_Designations2].[Sequence]'
                        WHEN 'HRM_Designations2_Sequence DESC' THEN '[HRM_Designations2].[Sequence] DESC'
                        WHEN 'HRM_Designations3_DesignationID' THEN '[HRM_Designations3].[DesignationID]'
                        WHEN 'HRM_Designations3_DesignationID DESC' THEN '[HRM_Designations3].[DesignationID] DESC'
                        WHEN 'HRM_Designations3_Description' THEN '[HRM_Designations3].[Description]'
                        WHEN 'HRM_Designations3_Description DESC' THEN '[HRM_Designations3].[Description] DESC'
                        WHEN 'HRM_Designations3_ShortName' THEN '[HRM_Designations3].[ShortName]'
                        WHEN 'HRM_Designations3_ShortName DESC' THEN '[HRM_Designations3].[ShortName] DESC'
                        WHEN 'HRM_Designations3_Sequence' THEN '[HRM_Designations3].[Sequence]'
                        WHEN 'HRM_Designations3_Sequence DESC' THEN '[HRM_Designations3].[Sequence] DESC'
                        WHEN 'aspnet_Users4_UserName' THEN '[aspnet_Users4].[UserName]'
                        WHEN 'aspnet_Users4_UserName DESC' THEN '[aspnet_Users4].[UserName] DESC'
                        WHEN 'aspnet_Users4_UserFullName' THEN '[aspnet_Users4].[UserFullName]'
                        WHEN 'aspnet_Users4_UserFullName DESC' THEN '[aspnet_Users4].[UserFullName] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[C_DateOfJoining],
		[HRM_Employees].[C_DepartmentID],
		[HRM_Employees].[C_DesignationID],
		[HRM_Employees].[U_UnderPromotion],
		[HRM_Employees].[U_NewDesignationID],
		[HRM_Employees].[C_PromotionOn],
		[HRM_Employees].[C_PromotionRemark],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[Confirmed],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedBy],
		[HRM_Departments1].[DepartmentID] AS HRM_Departments1_DepartmentID,
		[HRM_Departments1].[Description] AS HRM_Departments1_Description,
		[HRM_Designations2].[DesignationID] AS HRM_Designations2_DesignationID,
		[HRM_Designations2].[Description] AS HRM_Designations2_Description,
		[HRM_Designations2].[ShortName] AS HRM_Designations2_ShortName,
		[HRM_Designations2].[Sequence] AS HRM_Designations2_Sequence,
		[HRM_Designations3].[DesignationID] AS HRM_Designations3_DesignationID,
		[HRM_Designations3].[Description] AS HRM_Designations3_Description,
		[HRM_Designations3].[ShortName] AS HRM_Designations3_ShortName,
		[HRM_Designations3].[Sequence] AS HRM_Designations3_Sequence,
		[aspnet_Users4].[UserName] AS aspnet_Users4_UserName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments1].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations2]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations2].[DesignationID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
