USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmaapRegisteredDevicesSelectListSearch]
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
  SELECT [MAPP_RegisteredDevices].[SerialNo] FROM [MAPP_RegisteredDevices]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_RegisteredDevices].[UserID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MAPP_RegisteredDevices].[RegisteredBy] = [aspnet_users2].[LoginID]
 WHERE  
   ( 
         STR(ISNULL([MAPP_RegisteredDevices].[SerialNo], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_RegisteredDevices].[DeviceID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_RegisteredDevices].[UserID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([MAPP_RegisteredDevices].[RegisteredBy],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'SerialNo' THEN [MAPP_RegisteredDevices].[SerialNo] END,
     CASE @OrderBy WHEN 'SerialNo DESC' THEN [MAPP_RegisteredDevices].[SerialNo] END DESC,
     CASE @OrderBy WHEN 'DeviceID' THEN [MAPP_RegisteredDevices].[DeviceID] END,
     CASE @OrderBy WHEN 'DeviceID DESC' THEN [MAPP_RegisteredDevices].[DeviceID] END DESC,
     CASE @OrderBy WHEN 'UserID' THEN [MAPP_RegisteredDevices].[UserID] END,
     CASE @OrderBy WHEN 'UserID DESC' THEN [MAPP_RegisteredDevices].[UserID] END DESC,
     CASE @OrderBy WHEN 'RequestedOn' THEN [MAPP_RegisteredDevices].[RequestedOn] END,
     CASE @OrderBy WHEN 'RequestedOn DESC' THEN [MAPP_RegisteredDevices].[RequestedOn] END DESC,
     CASE @OrderBy WHEN 'IsRegistered' THEN [MAPP_RegisteredDevices].[IsRegistered] END,
     CASE @OrderBy WHEN 'IsRegistered DESC' THEN [MAPP_RegisteredDevices].[IsRegistered] END DESC,
     CASE @OrderBy WHEN 'IsExpired' THEN [MAPP_RegisteredDevices].[IsExpired] END,
     CASE @OrderBy WHEN 'IsExpired DESC' THEN [MAPP_RegisteredDevices].[IsExpired] END DESC,
     CASE @OrderBy WHEN 'ExpiredOn' THEN [MAPP_RegisteredDevices].[ExpiredOn] END,
     CASE @OrderBy WHEN 'ExpiredOn DESC' THEN [MAPP_RegisteredDevices].[ExpiredOn] END DESC,
     CASE @OrderBy WHEN 'RegisteredOn' THEN [MAPP_RegisteredDevices].[RegisteredOn] END,
     CASE @OrderBy WHEN 'RegisteredOn DESC' THEN [MAPP_RegisteredDevices].[RegisteredOn] END DESC,
     CASE @OrderBy WHEN 'RegisteredBy' THEN [MAPP_RegisteredDevices].[RegisteredBy] END,
     CASE @OrderBy WHEN 'RegisteredBy DESC' THEN [MAPP_RegisteredDevices].[RegisteredBy] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC 

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
