USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmaap_LG_RegisteredDevicesSelectByDeviceIDUserID]
  @LoginID NVarChar(8),
  @UserID NVarChar(8),
  @DeviceID NVarChar(50) 
  AS
  SELECT
    [MAPP_RegisteredDevices].* ,
    [aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
    [aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName 
  FROM [MAPP_RegisteredDevices] 
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users1]
    ON [MAPP_RegisteredDevices].[UserID] = [aspnet_users1].[LoginID]
  LEFT OUTER JOIN [aspnet_users] AS [aspnet_users2]
    ON [MAPP_RegisteredDevices].[RegisteredBy] = [aspnet_users2].[LoginID]
  WHERE
  [MAPP_RegisteredDevices].[DeviceID] = @DeviceID
   AND [MAPP_RegisteredDevices].[UserID] = @UserID
GO
