USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmaapRegisteredDevicesInsert]
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
  @Return_SerialNo Int = null OUTPUT 
  AS
  INSERT [MAPP_RegisteredDevices]
  (
   [DeviceID]
  ,[UserID]
  ,[UserName]
  ,[MobileNo]
  ,[RequestedOn]
  ,[IsRegistered]
  ,[IsExpired]
  ,[ExpiredOn]
  ,[RegisteredOn]
  ,[RegisteredBy]
  )
  VALUES
  (
   @DeviceID
  ,@UserID
  ,@UserName
  ,@MobileNo
  ,@RequestedOn
  ,@IsRegistered
  ,@IsExpired
  ,@ExpiredOn
  ,@RegisteredOn
  ,@RegisteredBy
  )
  SET @Return_SerialNo = Scope_Identity()
GO
