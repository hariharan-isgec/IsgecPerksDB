USE [IJTPerks]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spmaapRegisteredDevicesDelete]
  @Original_SerialNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [MAPP_RegisteredDevices]
  WHERE
  [MAPP_RegisteredDevices].[SerialNo] = @Original_SerialNo
  SET @RowCount = @@RowCount
GO
