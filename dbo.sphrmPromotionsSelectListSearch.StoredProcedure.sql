USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPromotionsSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @U_UnderPromotion Bit,
  @Resigned Bit,
  @ActiveState Bit,
  @Confirmed Bit,
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
  LEFT OUTER JOIN [HRM_Designations] AS [HRM_Designations3]
    ON [HRM_Employees].[U_NewDesignationID] = [HRM_Designations3].[DesignationID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users4]
    ON [HRM_Employees].[ModifiedBy] = [aspnet_Users4].[UserName]
 WHERE  
      [HRM_Employees].[U_UnderPromotion] = @U_UnderPromotion
  AND [HRM_Employees].[Resigned] = @Resigned
  AND [HRM_Employees].[ActiveState] = @ActiveState
  --AND [HRM_Employees].[Confirmed] = @Confirmed
   AND ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_DepartmentID],'')) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[C_DesignationID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([HRM_Employees].[U_NewDesignationID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[C_PromotionRemark],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[ModifiedEvent],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Employees].[ModifiedBy],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Departments1].[DepartmentID],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Departments1].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Designations2].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Designations2].[ShortName],'')) LIKE @KeyWord1
--     OR STR(ISNULL([HRM_Designations2].[Sequence], 0)) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Designations3].[Description],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([HRM_Designations3].[ShortName],'')) LIKE @KeyWord1
--     OR STR(ISNULL([HRM_Designations3].[Sequence], 0)) LIKE @KeyWord1
--     OR LOWER(ISNULL([aspnet_Users4].[UserName],'')) LIKE @KeyWord1
--     OR LOWER(ISNULL([aspnet_Users4].[UserFullName],'')) LIKE @KeyWord1
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
     CASE @orderBy WHEN 'U_UnderPromotion' THEN [HRM_Employees].[U_UnderPromotion] END,
     CASE @orderBy WHEN 'U_UnderPromotion DESC' THEN [HRM_Employees].[U_UnderPromotion] END DESC,
     CASE @orderBy WHEN 'U_NewDesignationID' THEN [HRM_Employees].[U_NewDesignationID] END,
     CASE @orderBy WHEN 'U_NewDesignationID DESC' THEN [HRM_Employees].[U_NewDesignationID] END DESC,
     CASE @orderBy WHEN 'C_PromotionOn' THEN [HRM_Employees].[C_PromotionOn] END,
     CASE @orderBy WHEN 'C_PromotionOn DESC' THEN [HRM_Employees].[C_PromotionOn] END DESC,
     CASE @orderBy WHEN 'C_PromotionRemark' THEN [HRM_Employees].[C_PromotionRemark] END,
     CASE @orderBy WHEN 'C_PromotionRemark DESC' THEN [HRM_Employees].[C_PromotionRemark] END DESC,
     CASE @orderBy WHEN 'Resigned' THEN [HRM_Employees].[Resigned] END,
     CASE @orderBy WHEN 'Resigned DESC' THEN [HRM_Employees].[Resigned] END DESC,
     CASE @orderBy WHEN 'ActiveState' THEN [HRM_Employees].[ActiveState] END,
     CASE @orderBy WHEN 'ActiveState DESC' THEN [HRM_Employees].[ActiveState] END DESC,
     CASE @orderBy WHEN 'Confirmed' THEN [HRM_Employees].[Confirmed] END,
     CASE @orderBy WHEN 'Confirmed DESC' THEN [HRM_Employees].[Confirmed] END DESC,
     CASE @orderBy WHEN 'ModifiedEvent' THEN [HRM_Employees].[ModifiedEvent] END,
     CASE @orderBy WHEN 'ModifiedEvent DESC' THEN [HRM_Employees].[ModifiedEvent] END DESC,
     CASE @orderBy WHEN 'ModifiedOn' THEN [HRM_Employees].[ModifiedOn] END,
     CASE @orderBy WHEN 'ModifiedOn DESC' THEN [HRM_Employees].[ModifiedOn] END DESC,
     CASE @orderBy WHEN 'ModifiedBy' THEN [HRM_Employees].[ModifiedBy] END,
     CASE @orderBy WHEN 'ModifiedBy DESC' THEN [HRM_Employees].[ModifiedBy] END DESC,
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
     CASE @orderBy WHEN 'HRM_Designations3_DesignationID' THEN [HRM_Designations3].[DesignationID] END,
     CASE @orderBy WHEN 'HRM_Designations3_DesignationID DESC' THEN [HRM_Designations3].[DesignationID] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_Description' THEN [HRM_Designations3].[Description] END,
     CASE @orderBy WHEN 'HRM_Designations3_Description DESC' THEN [HRM_Designations3].[Description] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_ShortName' THEN [HRM_Designations3].[ShortName] END,
     CASE @orderBy WHEN 'HRM_Designations3_ShortName DESC' THEN [HRM_Designations3].[ShortName] END DESC,
     CASE @orderBy WHEN 'HRM_Designations3_Sequence' THEN [HRM_Designations3].[Sequence] END,
     CASE @orderBy WHEN 'HRM_Designations3_Sequence DESC' THEN [HRM_Designations3].[Sequence] END DESC,
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
