USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPersonalProfileSelectListSearch]
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
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
  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups1]
    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups1].[BloodGroupID]
 WHERE  
   ( 
         LOWER(ISNULL([HRM_Employees].[CardNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EmployeeName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[FatherName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[SpouseName],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PermanentAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PermanentCity],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[CurrentAddress],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[CurrentCity],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ContactNumbers],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[OfficeFileNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PFNumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[ESINumber],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[PAN],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_Employees].[EMailID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_BloodGroups1].[BloodGroupID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([HRM_BloodGroups1].[Description],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @orderBy WHEN 'CardNo' THEN [HRM_Employees].[CardNo] END,
     CASE @orderBy WHEN 'CardNo DESC' THEN [HRM_Employees].[CardNo] END DESC,
     CASE @orderBy WHEN 'EmployeeName' THEN [HRM_Employees].[EmployeeName] END,
     CASE @orderBy WHEN 'EmployeeName DESC' THEN [HRM_Employees].[EmployeeName] END DESC,
     CASE @orderBy WHEN 'FatherName' THEN [HRM_Employees].[FatherName] END,
     CASE @orderBy WHEN 'FatherName DESC' THEN [HRM_Employees].[FatherName] END DESC,
     CASE @orderBy WHEN 'SpouseName' THEN [HRM_Employees].[SpouseName] END,
     CASE @orderBy WHEN 'SpouseName DESC' THEN [HRM_Employees].[SpouseName] END DESC,
     CASE @orderBy WHEN 'PermanentAddress' THEN [HRM_Employees].[PermanentAddress] END,
     CASE @orderBy WHEN 'PermanentAddress DESC' THEN [HRM_Employees].[PermanentAddress] END DESC,
     CASE @orderBy WHEN 'PermanentCity' THEN [HRM_Employees].[PermanentCity] END,
     CASE @orderBy WHEN 'PermanentCity DESC' THEN [HRM_Employees].[PermanentCity] END DESC,
     CASE @orderBy WHEN 'CurrentAddress' THEN [HRM_Employees].[CurrentAddress] END,
     CASE @orderBy WHEN 'CurrentAddress DESC' THEN [HRM_Employees].[CurrentAddress] END DESC,
     CASE @orderBy WHEN 'CurrentCity' THEN [HRM_Employees].[CurrentCity] END,
     CASE @orderBy WHEN 'CurrentCity DESC' THEN [HRM_Employees].[CurrentCity] END DESC,
     CASE @orderBy WHEN 'DateOfBirth' THEN [HRM_Employees].[DateOfBirth] END,
     CASE @orderBy WHEN 'DateOfBirth DESC' THEN [HRM_Employees].[DateOfBirth] END DESC,
     CASE @orderBy WHEN 'BloodGroupID' THEN [HRM_Employees].[BloodGroupID] END,
     CASE @orderBy WHEN 'BloodGroupID DESC' THEN [HRM_Employees].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'ContactNumbers' THEN [HRM_Employees].[ContactNumbers] END,
     CASE @orderBy WHEN 'ContactNumbers DESC' THEN [HRM_Employees].[ContactNumbers] END DESC,
     CASE @orderBy WHEN 'OfficeFileNumber' THEN [HRM_Employees].[OfficeFileNumber] END,
     CASE @orderBy WHEN 'OfficeFileNumber DESC' THEN [HRM_Employees].[OfficeFileNumber] END DESC,
     CASE @orderBy WHEN 'PFNumber' THEN [HRM_Employees].[PFNumber] END,
     CASE @orderBy WHEN 'PFNumber DESC' THEN [HRM_Employees].[PFNumber] END DESC,
     CASE @orderBy WHEN 'ESINumber' THEN [HRM_Employees].[ESINumber] END,
     CASE @orderBy WHEN 'ESINumber DESC' THEN [HRM_Employees].[ESINumber] END DESC,
     CASE @orderBy WHEN 'PAN' THEN [HRM_Employees].[PAN] END,
     CASE @orderBy WHEN 'PAN DESC' THEN [HRM_Employees].[PAN] END DESC,
     CASE @orderBy WHEN 'EMailID' THEN [HRM_Employees].[EMailID] END,
     CASE @orderBy WHEN 'EMailID DESC' THEN [HRM_Employees].[EMailID] END DESC,
     CASE @orderBy WHEN 'HRM_BloodGroups1_BloodGroupID' THEN [HRM_BloodGroups1].[BloodGroupID] END,
     CASE @orderBy WHEN 'HRM_BloodGroups1_BloodGroupID DESC' THEN [HRM_BloodGroups1].[BloodGroupID] END DESC,
     CASE @orderBy WHEN 'HRM_BloodGroups1_Description' THEN [HRM_BloodGroups1].[Description] END,
     CASE @orderBy WHEN 'HRM_BloodGroups1_Description DESC' THEN [HRM_BloodGroups1].[Description] END DESC 

    SET @RecordCount = @@RowCount

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
    	INNER JOIN #PageIndex
          ON [HRM_Employees].[CardNo] = #PageIndex.CardNo
  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups1]
    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups1].[BloodGroupID]
  WHERE
        #PageIndex.IndexID > @startRowIndex
        AND #PageIndex.IndexID < (@startRowIndex + @maximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
