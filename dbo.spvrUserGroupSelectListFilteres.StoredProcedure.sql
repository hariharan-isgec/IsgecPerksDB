USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserGroupSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_GroupID Int,
  @Filter_RoleID NVarChar(20),
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
  SET @LGSQL = @LGSQL + '[VR_UserGroup].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_UserGroup] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_UserGroup].[UserID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [VR_Groups] AS [VR_Groups2]'
  SET @LGSQL = @LGSQL + '    ON [VR_UserGroup].[GroupID] = [VR_Groups2].[GroupID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_UserGroup].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_GroupID > 0) 
    SET @LGSQL = @LGSQL + ' AND [VR_UserGroup].[GroupID] = ' + STR(@Filter_GroupID)
  IF (@Filter_RoleID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_UserGroup].[RoleID] = ''' + @Filter_RoleID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[VR_UserGroup].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_UserGroup].[SerialNo] DESC'
                        WHEN 'UserID' THEN '[VR_UserGroup].[UserID]'
                        WHEN 'UserID DESC' THEN '[VR_UserGroup].[UserID] DESC'
                        WHEN 'GroupID' THEN '[VR_UserGroup].[GroupID]'
                        WHEN 'GroupID DESC' THEN '[VR_UserGroup].[GroupID] DESC'
                        WHEN 'RoleID' THEN '[VR_UserGroup].[RoleID]'
                        WHEN 'RoleID DESC' THEN '[VR_UserGroup].[RoleID] DESC'
                        WHEN 'OutOfContractApprover' THEN '[VR_UserGroup].[OutOfContractApprover]'
                        WHEN 'OutOfContractApprover DESC' THEN '[VR_UserGroup].[OutOfContractApprover] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'VR_Groups2_GroupName' THEN '[VR_Groups2].[GroupName]'
                        WHEN 'VR_Groups2_GroupName DESC' THEN '[VR_Groups2].[GroupName] DESC'
                        ELSE '[VR_UserGroup].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_UserGroup].[SerialNo] ,
		[VR_UserGroup].[UserID] ,
		[VR_UserGroup].[GroupID] ,
		[VR_UserGroup].[RoleID] ,
		[VR_UserGroup].[OutOfContractApprover] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[VR_Groups2].[GroupName] AS VR_Groups2_GroupName 
  FROM [VR_UserGroup] 
    	INNER JOIN #PageIndex
          ON [VR_UserGroup].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_UserGroup].[UserID] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [VR_Groups] AS [VR_Groups2]
    ON [VR_UserGroup].[GroupID] = [VR_Groups2].[GroupID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
