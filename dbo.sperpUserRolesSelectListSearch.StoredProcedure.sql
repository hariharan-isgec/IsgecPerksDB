USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpUserRolesSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  INSERT INTO #PageIndex (SerialNo)
  SELECT [ERP_UserRoles].[SerialNo] FROM [ERP_UserRoles]
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ERP_UserRoles].[RequesterID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [ERP_UserRoles].[ApproverID] = [aspnet_Users2].[LoginID]
  INNER JOIN [ERP_Roles] AS [ERP_Roles3]
    ON [ERP_UserRoles].[RoleID] = [ERP_Roles3].[RoleID]
 WHERE  
   ( 
         STR(ISNULL([ERP_UserRoles].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_UserRoles].[RequesterID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([ERP_UserRoles].[ApproverID],'')) LIKE @KeyWord1
     OR STR(ISNULL([ERP_UserRoles].[RoleID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [ERP_UserRoles].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [ERP_UserRoles].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'RequesterID' THEN [ERP_UserRoles].[RequesterID] END,
     CASE @OrderBy WHEN 'RequesterID DESC' THEN [ERP_UserRoles].[RequesterID] END DESC,
     CASE @OrderBy WHEN 'ApproverID' THEN [ERP_UserRoles].[ApproverID] END,
     CASE @OrderBy WHEN 'ApproverID DESC' THEN [ERP_UserRoles].[ApproverID] END DESC,
     CASE @OrderBy WHEN 'RoleID' THEN [ERP_UserRoles].[RoleID] END,
     CASE @OrderBy WHEN 'RoleID DESC' THEN [ERP_UserRoles].[RoleID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'ERP_Roles3_Description' THEN [ERP_Roles3].[Description] END,
     CASE @OrderBy WHEN 'ERP_Roles3_Description DESC' THEN [ERP_Roles3].[Description] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[ERP_UserRoles].[SerialNo] ,
		[ERP_UserRoles].[RequesterID] ,
		[ERP_UserRoles].[ApproverID] ,
		[ERP_UserRoles].[RoleID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[ERP_Roles3].[Description] AS ERP_Roles3_Description 
  FROM [ERP_UserRoles] 
    	INNER JOIN #PageIndex
          ON [ERP_UserRoles].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [ERP_UserRoles].[RequesterID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [ERP_UserRoles].[ApproverID] = [aspnet_Users2].[LoginID]
  INNER JOIN [ERP_Roles] AS [ERP_Roles3]
    ON [ERP_UserRoles].[RoleID] = [ERP_Roles3].[RoleID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
