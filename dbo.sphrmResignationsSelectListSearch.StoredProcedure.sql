USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmResignationsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @Resigned Bit,
  @ActiveState Bit,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex
  (
  IndexId INT IDENTITY (1, 1) NOT NULL,
  CardNo NVarChar(8) NOT NULL
  )
  INSERT INTO #PageIndex (CardNo)
  SELECT [HRM_Employees].[CardNo] FROM [HRM_Employees]
  LEFT OUTER JOIN [HRM_Departments] AS [HRM_Departments1]
    ON [HRM_Employees].[C_DepartmentID] = [HRM_Departments1].[DepartmentID]
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations2]
    ON [HRM_Employees].[C_DesignationID] = [HRM_Designations2].[DesignationID]
  LEFT OUTER JOIN [HRM_Status] AS [HRM_Status3]
    ON [HRM_Employees].[C_StatusID] = [HRM_Status3].[StatusID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]
 WHERE  
      [HRM_Employees].[Resigned] = @Resigned
  AND [HRM_Employees].[ActiveState] = @ActiveState
   AND ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_ResignedRemark],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ActiveStateEventName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ModifiedEvent],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments1].[DepartmentID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Departments1].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations2].[Description],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Designations2].[ShortName],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Designations2].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status3].[StatusID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Status3].[Description],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Status3].[Sequence], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users4].[UserName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([aspnet_Users4].[UserFullName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'C_DateOfJoining' THEN [HRM_Employees].[C_DateOfJoining] END,
     CASE @orderBy WHEN 'C_DateOfJoining DESC' THEN [HRM_Employees].[C_DateOfJoining] END DESC,
     CASE @orderBy WHEN 'C_DepartmentID' THEN [HRM_Employees].[C_DepartmentID] END,
     CASE @orderBy WHEN 'C_DepartmentID DESC' THEN [HRM_Employees].[C_DepartmentID] END DESC,
     CASE @orderBy WHEN 'C_DesignationID' THEN [HRM_Employees].[C_DesignationID] END,
     CASE @orderBy WHEN 'C_DesignationID DESC' THEN [HRM_Employees].[C_DesignationID] END DESC,
     CASE @orderBy WHEN 'C_StatusID' THEN [HRM_Employees].[C_StatusID] END,
     CASE @orderBy WHEN 'C_StatusID DESC' THEN [HRM_Employees].[C_StatusID] END DESC,
     CASE @orderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @orderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @orderBy WHEN 'C_ResignedOn' THEN [HRM_Employees].[C_ResignedOn] END,
     CASE @orderBy WHEN 'C_ResignedOn DESC' THEN [HRM_Employees].[C_ResignedOn] END DESC,
     CASE @orderBy WHEN 'C_DateOfReleaving' THEN [HRM_Employees].[C_DateOfReleaving] END,
     CASE @orderBy WHEN 'C_DateOfReleaving DESC' THEN [HRM_Employees].[C_DateOfReleaving] END DESC,
     CASE @orderBy WHEN 'C_ResignedRemark' THEN [HRM_Employees].[C_ResignedRemark] END,
     CASE @orderBy WHEN 'C_ResignedRemark DESC' THEN [HRM_Employees].[C_ResignedRemark] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'ActiveStateEventName' THEN [HRM_Employees].[ActiveStateEventName] END,
     CASE @orderBy WHEN 'ActiveStateEventName DESC' THEN [HRM_Employees].[ActiveStateEventName] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedEvent' THEN [HRM_Employees].[ModifiedEvent] END,
     CASE @orderBy WHEN 'ModifiedEvent DESC' THEN [HRM_Employees].[ModifiedEvent] END DESC,
     CASE @orderBy WHEN 'HRM_Departments1_DepartmentID' THEN [HRM_Departments1].[DepartmentID] END,
     CASE @orderBy WHEN 'HRM_Departments1_DepartmentID DESC' THEN [HRM_Departments1].[DepartmentID] END DESC,
     CASE @orderBy WHEN 'HRM_Departments1_Description' THEN [HRM_Departments1].[Description] END,
     CASE @orderBy WHEN 'HRM_Departments1_Description DESC' THEN [HRM_Departments1].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations2_DesignationID' THEN [HRM_Designations2].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations2_DesignationID DESC' THEN [HRM_Designations2].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations2_Description' THEN [HRM_Designations2].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations2_Description DESC' THEN [HRM_Designations2].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations2_ShortName' THEN [HRM_Designations2].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations2_ShortName DESC' THEN [HRM_Designations2].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations2_Sequence' THEN [HRM_Designations2].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations2_Sequence DESC' THEN [HRM_Designations2].[Sequence] END DESC,
     CASE @orderBy WHEN 'HRM_Status3_StatusID' THEN [HRM_Status3].[StatusID] END,
     CASE @orderBy WHEN 'HRM_Status3_StatusID DESC' THEN [HRM_Status3].[StatusID] END DESC,
     CASE @orderBy WHEN 'HRM_Status3_Description' THEN [HRM_Status3].[Description] END,
     CASE @orderBy WHEN 'HRM_Status3_Description DESC' THEN [HRM_Status3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Status3_Sequence' THEN [HRM_Status3].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Status3_Sequence DESC' THEN [HRM_Status3].[Sequence] END DESC,
     CASE @orderBy WHEN 'aspnet_Users4_UserName' THEN [aspnet_Users4].[UserName] END,
     CASE @orderBy WHEN 'aspnet_Users4_UserName DESC' THEN [aspnet_Users4].[UserName] END DESC,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName' THEN [aspnet_Users4].[UserFullName] END,
     CASE @orderBy WHEN 'aspnet_Users4_UserFullName DESC' THEN [aspnet_Users4].[UserFullName] END DESC 

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
