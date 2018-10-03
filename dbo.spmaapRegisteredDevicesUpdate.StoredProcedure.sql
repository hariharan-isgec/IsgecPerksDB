USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmaapRegisteredDevicesUpdate]
  @Original_SerialNo Int, 
  @DeviceID NVarChar(50),
  @UserID NVarChar(8),
  @UserName NVarChar(50),
  @MobileNo NVarChar(15),
  @RequestedOn DateTime,
  @IsRegistered Bit,
  @IsExpired Bit,
  @ExpiredOn DateTime,
  @RegisteredOn DateTime,
  @RegisteredBy NVarChar(8),
  @RowCount int = null OUTPUT
  AS
  UPDATE [MAPP_RegisteredDevices] SET 
   [DeviceID] = @DeviceID
  ,[UserID] = @UserID
  ,[UserName] = @UserName
  ,[MobileNo] = @MobileNo
  ,[RequestedOn] = @RequestedOn
  ,[IsRegistered] = @IsRegistered
  ,[IsExpired] = @IsExpired
  ,[ExpiredOn] = @ExpiredOn
  ,[RegisteredOn] = @RegisteredOn
  ,[RegisteredBy] = @RegisteredBy
  WHERE
  [SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
