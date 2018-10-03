USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sperpUserRolesSelectListFilteres]
  @Filter_RequesterID NVarChar(8),
  @Filter_ApproverID NVarChar(8),
  @Filter_RoleID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,SerialNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'SerialNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[ERP_UserRoles].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [ERP_UserRoles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [ERP_UserRoles].[RequesterID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [ERP_UserRoles].[ApproverID] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [ERP_Roles] AS [ERP_Roles3]'
  SET @LGSQL = @LGSQL + '    ON [ERP_UserRoles].[RoleID] = [ERP_Roles3].[RoleID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_RequesterID > '') 
    SET @LGSQL = @LGSQL + ' AND [ERP_UserRoles].[RequesterID] = ''' + @Filter_RequesterID + ''''
  IF (@Filter_ApproverID > '') 
    SET @LGSQL = @LGSQL + ' AND [ERP_UserRoles].[ApproverID] = ''' + @Filter_ApproverID + ''''
  IF (@Filter_RoleID > 0) 
    SET @LGSQL = @LGSQL + ' AND [ERP_UserRoles].[RoleID] = ' + STR(@Filter_RoleID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[ERP_UserRoles].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[ERP_UserRoles].[SerialNo] DESC'
                        WHEN 'RequesterID' THEN '[ERP_UserRoles].[RequesterID]'
                        WHEN 'RequesterID DESC' THEN '[ERP_UserRoles].[RequesterID] DESC'
                        WHEN 'ApproverID' THEN '[ERP_UserRoles].[ApproverID]'
                        WHEN 'ApproverID DESC' THEN '[ERP_UserRoles].[ApproverID] DESC'
                        WHEN 'RoleID' THEN '[ERP_UserRoles].[RoleID]'
                        WHEN 'RoleID DESC' THEN '[ERP_UserRoles].[RoleID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'ERP_Roles3_Description' THEN '[ERP_Roles3].[Description]'
                        WHEN 'ERP_Roles3_Description DESC' THEN '[ERP_Roles3].[Description] DESC'
                        ELSE '[ERP_UserRoles].[SerialNo]'
                    END
  EXEC (@LGSQL)

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
