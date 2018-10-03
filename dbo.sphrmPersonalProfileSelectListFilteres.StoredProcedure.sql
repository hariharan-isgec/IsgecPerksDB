USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sphrmPersonalProfileSelectListFilteres]
  @StartRowIndex int,
  @MaximumRows int,
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
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_BloodGroups] AS [HRM_BloodGroups1]'
  SET @LGSQL = @LGSQL + '    ON [HRM_Employees].[BloodGroupID] = [HRM_BloodGroups1].[BloodGroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'CardNo' THEN '[HRM_Employees].[CardNo]'
                        WHEN 'CardNo DESC' THEN '[HRM_Employees].[CardNo] DESC'
                        WHEN 'EmployeeName' THEN '[HRM_Employees].[EmployeeName]'
                        WHEN 'EmployeeName DESC' THEN '[HRM_Employees].[EmployeeName] DESC'
                        WHEN 'FatherName' THEN '[HRM_Employees].[FatherName]'
                        WHEN 'FatherName DESC' THEN '[HRM_Employees].[FatherName] DESC'
                        WHEN 'SpouseName' THEN '[HRM_Employees].[SpouseName]'
                        WHEN 'SpouseName DESC' THEN '[HRM_Employees].[SpouseName] DESC'
                        WHEN 'PermanentAddress' THEN '[HRM_Employees].[PermanentAddress]'
                        WHEN 'PermanentAddress DESC' THEN '[HRM_Employees].[PermanentAddress] DESC'
                        WHEN 'PermanentCity' THEN '[HRM_Employees].[PermanentCity]'
                        WHEN 'PermanentCity DESC' THEN '[HRM_Employees].[PermanentCity] DESC'
                        WHEN 'CurrentAddress' THEN '[HRM_Employees].[CurrentAddress]'
                        WHEN 'CurrentAddress DESC' THEN '[HRM_Employees].[CurrentAddress] DESC'
                        WHEN 'CurrentCity' THEN '[HRM_Employees].[CurrentCity]'
                        WHEN 'CurrentCity DESC' THEN '[HRM_Employees].[CurrentCity] DESC'
                        WHEN 'DateOfBirth' THEN '[HRM_Employees].[DateOfBirth]'
                        WHEN 'DateOfBirth DESC' THEN '[HRM_Employees].[DateOfBirth] DESC'
                        WHEN 'BloodGroupID' THEN '[HRM_Employees].[BloodGroupID]'
                        WHEN 'BloodGroupID DESC' THEN '[HRM_Employees].[BloodGroupID] DESC'
                        WHEN 'ContactNumbers' THEN '[HRM_Employees].[ContactNumbers]'
                        WHEN 'ContactNumbers DESC' THEN '[HRM_Employees].[ContactNumbers] DESC'
                        WHEN 'OfficeFileNumber' THEN '[HRM_Employees].[OfficeFileNumber]'
                        WHEN 'OfficeFileNumber DESC' THEN '[HRM_Employees].[OfficeFileNumber] DESC'
                        WHEN 'PFNumber' THEN '[HRM_Employees].[PFNumber]'
                        WHEN 'PFNumber DESC' THEN '[HRM_Employees].[PFNumber] DESC'
                        WHEN 'ESINumber' THEN '[HRM_Employees].[ESINumber]'
                        WHEN 'ESINumber DESC' THEN '[HRM_Employees].[ESINumber] DESC'
                        WHEN 'PAN' THEN '[HRM_Employees].[PAN]'
                        WHEN 'PAN DESC' THEN '[HRM_Employees].[PAN] DESC'
                        WHEN 'EMailID' THEN '[HRM_Employees].[EMailID]'
                        WHEN 'EMailID DESC' THEN '[HRM_Employees].[EMailID] DESC'
                        WHEN 'HRM_BloodGroups1_BloodGroupID' THEN '[HRM_BloodGroups1].[BloodGroupID]'
                        WHEN 'HRM_BloodGroups1_BloodGroupID DESC' THEN '[HRM_BloodGroups1].[BloodGroupID] DESC'
                        WHEN 'HRM_BloodGroups1_Description' THEN '[HRM_BloodGroups1].[Description]'
                        WHEN 'HRM_BloodGroups1_Description DESC' THEN '[HRM_BloodGroups1].[Description] DESC'
                        ELSE '[HRM_Employees].[CardNo]'
                    END
  EXEC (@LGSQL)

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
