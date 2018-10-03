USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPersonalProfileSelectByID]
  @CardNo NVarChar(8)
  AS
  SELECT
		[HRM_Employees].[CardNo],
		[HRM_Employees].[EmployeeName],
		[HRM_Employees].[FatherName],
		[HRM_Employees].[SpouseName],
		[HRM_Employees].[PermanentAddress],
		[HRM_Employees].[PermanentCity],
		[HRM_Employees].[CurrentAddress],
		[HRM_Employees].[CurrentCity],
		[HRM_Employees].[DateOfBirth],
		[HRM_Employees].[BloodGroupID],
		[HRM_Employees].[ContactNumbers],
		[HRM_Employees].[OfficeFileNumber],
		[HRM_Employees].[PFNumber],
		[HRM_Employees].[ESINumber],
		[HRM_Employees].[PAN],
		[HRM_Employees].[EMailID],
		[HRM_BloodGroups1].[BloodGroupID] AS HRM_BloodGroups1_BloodGroupID,
		[HRM_BloodGroups1].[Description] AS HRM_BloodGroups1_Description 
  FROM [HRM_Employees] 
  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups1]
    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups1].[BloodGroupID]
  WHERE
  [HRM_Employees].[CardNo] = @CardNo
GO
