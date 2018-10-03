USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmaapRegisteredDevicesSelectListFilteres]
  @Filter_UserID NVarChar(8),
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
  SET @LGSQL = @LGSQL + '[MAPP_RegisteredDevices].[SerialNo]'
  SET @LGSQL = @LGSQL + ' FROM [MAPP_RegisteredDevices] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]'
  SET @LGSQL = @LGSQL + '    ON [MAPP_RegisteredDevices].[UserID] = [aspnet_users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]'
  SET @LGSQL = @LGSQL + '    ON [MAPP_RegisteredDevices].[RegisteredBy] = [aspnet_users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_UserID > '') 
    SET @LGSQL = @LGSQL + ' AND [MAPP_RegisteredDevices].[UserID] = ''' + @Filter_UserID + ''''
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'SerialNo' THEN '[MAPP_RegisteredDevices].[SerialNo]'
                        WHEN 'SerialNo DESC' THEN '[MAPP_RegisteredDevices].[SerialNo] DESC'
                        WHEN 'DeviceID' THEN '[MAPP_RegisteredDevices].[DeviceID]'
                        WHEN 'DeviceID DESC' THEN '[MAPP_RegisteredDevices].[DeviceID] DESC'
                        WHEN 'UserID' THEN '[MAPP_RegisteredDevices].[UserID]'
                        WHEN 'UserID DESC' THEN '[MAPP_RegisteredDevices].[UserID] DESC'
                        WHEN 'RequestedOn' THEN '[MAPP_RegisteredDevices].[RequestedOn]'
                        WHEN 'RequestedOn DESC' THEN '[MAPP_RegisteredDevices].[RequestedOn] DESC'
                        WHEN 'IsRegistered' THEN '[MAPP_RegisteredDevices].[IsRegistered]'
                        WHEN 'IsRegistered DESC' THEN '[MAPP_RegisteredDevices].[IsRegistered] DESC'
                        WHEN 'IsExpired' THEN '[MAPP_RegisteredDevices].[IsExpired]'
                        WHEN 'IsExpired DESC' THEN '[MAPP_RegisteredDevices].[IsExpired] DESC'
                        WHEN 'ExpiredOn' THEN '[MAPP_RegisteredDevices].[ExpiredOn]'
                        WHEN 'ExpiredOn DESC' THEN '[MAPP_RegisteredDevices].[ExpiredOn] DESC'
                        WHEN 'RegisteredOn' THEN '[MAPP_RegisteredDevices].[RegisteredOn]'
                        WHEN 'RegisteredOn DESC' THEN '[MAPP_RegisteredDevices].[RegisteredOn] DESC'
                        WHEN 'RegisteredBy' THEN '[MAPP_RegisteredDevices].[RegisteredBy]'
                        WHEN 'RegisteredBy DESC' THEN '[MAPP_RegisteredDevices].[RegisteredBy] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        ELSE '[MAPP_RegisteredDevices].[SerialNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [MAPP_RegisteredDevices].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName 
  FROM [MAPP_RegisteredDevices] 
      INNER JOIN #PageIndex
          ON [MAPP_RegisteredDevices].[SerialNo] = #PageIndex.SerialNo
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_RegisteredDevices].[UserID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MAPP_RegisteredDevices].[RegisteredBy] = [aspnet_users2].[LoginID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
GO
