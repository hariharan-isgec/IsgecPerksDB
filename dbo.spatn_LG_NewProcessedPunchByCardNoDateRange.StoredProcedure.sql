USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spatn_LG_NewProcessedPunchByCardNoDateRange]
  @FCardNo NVarChar(8),
  @FAttenDate DateTime,
  @TCardNo NVarChar(8),
  @TAttenDate DateTime,
  @OrderBy NVarChar(50)    
AS
BEGIN
  SELECT
		[ATN_Attendance].*,  
		[HRM_Employees1].[CardNo] AS HRM_Employees1_CardNo,
		[HRM_Employees1].[EmployeeName] AS HRM_Employees1_EmployeeName,
		[HRM_Employees1].[VerificationRequired] AS HRM_Employees1_VerificationRequired,
		[HRM_Employees1].[VerifierID] AS HRM_Employees1_VerifierID,
		[HRM_Employees1].[ApprovalRequired] AS HRM_Employees1_ApprovalRequired,
		[HRM_Employees1].[ApproverID] AS HRM_Employees1_ApproverID,
		[HRM_Employees1].[C_DateOfJoining] AS HRM_Employees1_C_DateOfJoining,
		[HRM_Employees1].[C_DateOfReleaving] AS HRM_Employees1_C_DateOfReleaving,
		[HRM_Employees1].[C_CompanyID] AS HRM_Employees1_C_CompanyID,
		[HRM_Employees1].[C_DivisionID] AS HRM_Employees1_C_DivisionID,
		[HRM_Employees1].[C_OfficeID] AS HRM_Employees1_C_OfficeID,
		[HRM_Employees1].[C_DepartmentID] AS HRM_Employees1_C_DepartmentID,
		[HRM_Employees1].[C_DesignationID] AS HRM_Employees1_C_DesignationID,
		[HRM_Employees1].[ActiveState] AS HRM_Employees1_ActiveState,
		[ATN_PunchStatus2].[PunchStatusID] AS ATN_PunchStatus2_PunchStatusID,
		[ATN_PunchStatus2].[Description] AS ATN_PunchStatus2_Description,
		[ATN_PunchStatus2].[PunchValue] AS ATN_PunchStatus2_PunchValue 
  FROM [ATN_Attendance] 
  INNER JOIN [HRM_Employees] AS [HRM_Employees1]
    ON [ATN_Attendance].[CardNo] = [HRM_Employees1].[CardNo]
  INNER JOIN [ATN_PunchStatus] AS [ATN_PunchStatus2]
    ON [ATN_Attendance].[PunchStatusID] = [ATN_PunchStatus2].[PunchStatusID]
  WHERE
      ([ATN_Attendance].[CardNo] >= @FCardNo 
  AND [ATN_Attendance].[CardNo] <= @TCardNo) 
  AND ([ATN_Attendance].[AttenDate] >= @FAttenDate
  AND [ATN_Attendance].[AttenDate] <= @TAttenDate) 
  AND ([ATN_Attendance].[Punch1Time] > 0)

  ORDER BY
     CASE @orderBy WHEN 'DepartmentWiseSummary' THEN (RANK() OVER(ORDER BY [HRM_Employees1].[C_DepartmentID],[ATN_Attendance].[AttenDate], [ATN_Attendance].[CardNo])) END,
     CASE @orderBy WHEN 'DepartmentWiseDetail' THEN (RANK() OVER(ORDER BY [HRM_Employees1].[C_DepartmentID],[ATN_Attendance].[CardNo], [ATN_Attendance].[AttenDate])) END, 
     CASE @orderBy WHEN 'OfficeWiseSummary' THEN (RANK() OVER(ORDER BY [HRM_Employees1].[C_OfficeID],[ATN_Attendance].[AttenDate], [ATN_Attendance].[CardNo])) END,
     CASE @orderBy WHEN 'OfficeWiseDetail' THEN (RANK() OVER(ORDER BY [HRM_Employees1].[C_OfficeID],[ATN_Attendance].[CardNo], [ATN_Attendance].[AttenDate])) END 

  END
GO
