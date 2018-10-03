USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spvrUserRolesSelectListFilteres]
  @Filter_UserID NVarChar(8),
  @Filter_DivisionID NVarChar(6),
  @Filter_RoleID NVarChar(15),
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
  SET @LGSQL = @LGSQL + '[VR_UserRoles].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [VR_UserRoles] '
  SET @LGSQL = @LGSQL + '  INNER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [VR_UserRoles].[UserID] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [HRM_Divisions] AS [HRM_Divisions2]'
  SET @LGSQL = @LGSQL + '    ON [VR_UserRoles].[DivisionID] = [HRM_Divisions2].[DivisionID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_UserRoles].[UserID] = ''' + @Filter_UserID + ''''
  IF (@Filter_DivisionID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_UserRoles].[DivisionID] = ''' + @Filter_DivisionID + ''''
  IF (@Filter_RoleID > '') 
    SET @LGSQL = @LGSQL + ' AND [VR_UserRoles].[RoleID] = ''' + @Filter_RoleID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[VR_UserRoles].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[VR_UserRoles].[SerialNo] DESC'
                        WHEN 'UserID' THEN '[VR_UserRoles].[UserID]'
                        WHEN 'UserID DESC' THEN '[VR_UserRoles].[UserID] DESC'
                        WHEN 'DivisionID' THEN '[VR_UserRoles].[DivisionID]'
                        WHEN 'DivisionID DESC' THEN '[VR_UserRoles].[DivisionID] DESC'
                        WHEN 'RoleID' THEN '[VR_UserRoles].[RoleID]'
                        WHEN 'RoleID DESC' THEN '[VR_UserRoles].[RoleID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'HRM_Divisions2_Description' THEN '[HRM_Divisions2].[Description]'
                        WHEN 'HRM_Divisions2_Description DESC' THEN '[HRM_Divisions2].[Description] DESC'
                        ELSE '[VR_UserRoles].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[VR_UserRoles].[SerialNo] ,
		[VR_UserRoles].[UserID] ,
		[VR_UserRoles].[DivisionID] ,
		[VR_UserRoles].[RoleID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[HRM_Divisions2].[Description] AS HRM_Divisions2_Description 
  FROM [VR_UserRoles] 
    	INNER JOIN #PageIndex
          ON [VR_UserRoles].[SerialNo] = #PageIndex.SerialNo
  INNER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [VR_UserRoles].[UserID] = [aspnet_Users1].[LoginID]
  INNER JOIN [HRM_Divisions] AS [HRM_Divisions2]
    ON [VR_UserRoles].[DivisionID] = [HRM_Divisions2].[DivisionID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
