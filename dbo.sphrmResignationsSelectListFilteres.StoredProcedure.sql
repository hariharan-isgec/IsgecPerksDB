USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
  @Resigned Bit,
  @ActiveState Bit,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status3]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[C_StatusID] = [HRM_Status3].[StatusID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[Resigned] = ' + STR(@Resigned) 
  SET @LGSQL = @LGSQL + ' AND [HRM_Employees].[ActiveState] = ' + STR(@ActiveState) 
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
                        WHEN 'C_StatusID' THEN '[HRM_Employees].[C_StatusID]'
                        WHEN 'C_StatusID DESC' THEN '[HRM_Employees].[C_StatusID] DESC'
                        WHEN 'Resigned' THEN '[HRM_Employees].[Resigned]'
                        WHEN 'Resigned DESC' THEN '[HRM_Employees].[Resigned] DESC'
                        WHEN 'C_ResignedOn' THEN '[HRM_Employees].[C_ResignedOn]'
                        WHEN 'C_ResignedOn DESC' THEN '[HRM_Employees].[C_ResignedOn] DESC'
                        WHEN 'C_DateOfReleaving' THEN '[HRM_Employees].[C_DateOfReleaving]'
                        WHEN 'C_DateOfReleaving DESC' THEN '[HRM_Employees].[C_DateOfReleaving] DESC'
                        WHEN 'C_ResignedRemark' THEN '[HRM_Employees].[C_ResignedRemark]'
                        WHEN 'C_ResignedRemark DESC' THEN '[HRM_Employees].[C_ResignedRemark] DESC'
                        WHEN 'ActiveState' THEN '[HRM_Employees].[ActiveState]'
                        WHEN 'ActiveState DESC' THEN '[HRM_Employees].[ActiveState] DESC'
                        WHEN 'ActiveStateEventName' THEN '[HRM_Employees].[ActiveStateEventName]'
                        WHEN 'ActiveStateEventName DESC' THEN '[HRM_Employees].[ActiveStateEventName] DESC'
                        WHEN 'ModifiedBy' THEN '[HRM_Employees].[ModifiedBy]'
                        WHEN 'ModifiedBy DESC' THEN '[HRM_Employees].[ModifiedBy] DESC'
                        WHEN 'ModifiedOn' THEN '[HRM_Employees].[ModifiedOn]'
                        WHEN 'ModifiedOn DESC' THEN '[HRM_Employees].[ModifiedOn] DESC'
                        WHEN 'ModifiedEvent' THEN '[HRM_Employees].[ModifiedEvent]'
                        WHEN 'ModifiedEvent DESC' THEN '[HRM_Employees].[ModifiedEvent] DESC'
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
                        WHEN 'HRM_Status3_StatusID' THEN '[HRM_Status3].[StatusID]'
                        WHEN 'HRM_Status3_StatusID DESC' THEN '[HRM_Status3].[StatusID] DESC'
                        WHEN 'HRM_Status3_Description' THEN '[HRM_Status3].[Description]'
                        WHEN 'HRM_Status3_Description DESC' THEN '[HRM_Status3].[Description] DESC'
                        WHEN 'HRM_Status3_Sequence' THEN '[HRM_Status3].[Sequence]'
                        WHEN 'HRM_Status3_Sequence DESC' THEN '[HRM_Status3].[Sequence] DESC'
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
		[HRM_Employees].[C_StatusID],
		[HRM_Employees].[Resigned],
		[HRM_Employees].[C_ResignedOn],
		[HRM_Employees].[C_DateOfReleaving],
		[HRM_Employees].[C_ResignedRemark],
		[HRM_Employees].[ActiveState],
		[HRM_Employees].[ActiveStateEventName],
		[HRM_Employees].[ModifiedBy],
		[HRM_Employees].[ModifiedOn],
		[HRM_Employees].[ModifiedEvent],
		[HRM_Departments1].[DepartmentID] AS HRM_Departments1_DepartmentID,
		[HRM_Departments1].[Description] AS HRM_Departments1_Description,
		[HRM_Designations2].[DesignationID] AS HRM_Designations2_DesignationID,
		[HRM_Designations2].[Description] AS HRM_Designations2_Description,
		[HRM_Designations2].[ShortName] AS HRM_Designations2_ShortName,
		[HRM_Designations2].[Sequence] AS HRM_Designations2_Sequence,
		[HRM_Status3].[StatusID] AS HRM_Status3_StatusID,
		[HRM_Status3].[Description] AS HRM_Status3_Description,
		[HRM_Status3].[Sequence] AS HRM_Status3_Sequence,
		[aspnet_Users4].[UserName] AS aspnet_Users4_UserName,
		[aspnet_Users4].[UserFullName] AS aspnet_Users4_UserFullName 
  FROM [HRM_Employees] 
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments1].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations2]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations2].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status3]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status3].[StatusID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
